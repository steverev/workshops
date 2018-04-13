#
# Cookbook:: tomcat
# Recipe:: install
#


# Recipe currently assumes base and updates repos exists on system
# per instructions installing version 1.7.0 (could install newer)

#install package

yum_package 'java-1.7.0-openjdk-devel' do
  action :install
end

# create group and user

group 'tomcat' do
  action :create
end

user 'tomcat' do
  comment "Tomcat User"
  home '/opt/tomcat'
  gid 'tomcat'
  shell '/bin/nologin'
  action :create
  manage_home true
end

# download Tomcat binary

remote_file "/tmp/apache-tomcat-8.5.30.tar.gz" do
  source 'https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.30/bin/apache-tomcat-8.5.30.tar.gz'
  not_if { ::File.exists?('/opt/tomcat')}
  #notifies :create, "template[#{extract_install}]"
  #not_if { ::File.exists?(/opt/tomcat) }
  #action :create_if_missing
  
end

# untar and install tomcat

bash 'extract_install' do
  cwd '/tmp'
  code <<-EOH
    mkdir -p /opt/tomcat
    tar xzf apache-tomcat-8.5.30.tar.gz -C /opt/tomcat --strip-components=1
    chgrp -R tomcat /opt/tomcat
    chmod -R g+r /opt/tomcat/conf
    chmod g+x /opt/tomcat/conf
    chown -R tomcat /opt/tomcat/webapps /opt/tomcat/work /opt/tomcat/temp /opt/tomcat/logs
    EOH
  #not_if { ::File.exist?(/opt/tomcat) }
end

# set up systemd Unit File

systemd_unit 'tomcat.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Apache Tomcat Web Application Container
  After=syslog.target network.target

  [Service]
  Type=forking

  Environment=JAVA_HOME=/usr/lib/jvm/jre
  Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
  Environment=CATALINA_HOME=/opt/tomcat
  Environment=CATALINA_BASE=/opt/tomcat
  Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
  Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

  ExecStart=/opt/tomcat/bin/startup.sh
  ExecStop=/bin/kill -15 $MAINPID

  User=tomcat
  Group=tomcat
  UMask=0007
  RestartSec=10
  Restart=always

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :start, :enable]
  triggers_reload true
end

