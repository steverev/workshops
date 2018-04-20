if os.family == 'redhat'
  describe yum.repo('mongodb') do
    it { should exist }
    it { should be_enabled }
    its('baseurl') { should include 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64' }
  end

  describe package('mongodb-org') do
    it { should be_installed }
  end

  describe service('mongod') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
	
  describe port(27017) do
    it { should be_listening }
    its('processes') { should include 'mongod' }
  end   
  
  describe user('mongod') do
    it { should exist }
    its('shell') { should eq '/bin/false' }
  end

end
