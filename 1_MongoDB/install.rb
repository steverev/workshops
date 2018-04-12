#
# Cookbook:: mongodb
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.


yum_repository 'mongodb' do
  description 'MongoDB Repository'
  baseurl "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64"
  gpgcheck false
  enabled true
  action :create
end

yum_package 'mongodb-org' do
  action :install
end

service 'mongod' do
  action [ :start, :enable ]
  subscribes :reload, 'file[/etc/mongodb/mongo.conf]', :immediately
end
