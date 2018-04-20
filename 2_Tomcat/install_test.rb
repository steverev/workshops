if os.family == 'redhat'
  describe package('java-1.7.0-openjdk-devel') do
    it { should be_installed }
  end
  describe user('tomcat') do
    it { should exist }
    its('shell') { should eq '/bin/nologin' }
    its('home') { should eq '/opt/tomcat' }
    its('groups') { should eq ['tomcat'] }
  end
  # Need to add test for Tomcat binary
  describe directory('/opt/tomcat') do
    its('group') { should eq 'tomcat'}
  end
  describe directory('/opt/tomcat/conf') do
    its('owner') { should eq 'tomcat'}
  end
  describe systemd_service('tomcat') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
 
  describe port(8080) do
    it { should be_listening }
    its('processes') {should include 'java'}
  end
end


