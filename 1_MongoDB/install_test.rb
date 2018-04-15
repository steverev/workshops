describe yum do
  its('repos') { should include 'mongodb' }
#  its('baseurl') { should include 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64' }
end

describe package('mongodb-org') do
  it { should be_installed }
end

describe service('mongod') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
