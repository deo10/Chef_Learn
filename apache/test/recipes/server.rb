# # encoding: utf-8

# Inspec test for recipe apache::server

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe user('web_admin') do
    it { should exist }
end

describe service('httpd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe 'configuration' do
  let(:config) { apache_conf.params }

  describe 'Timeout' do
    it 'should be <= 300' do
      expect(config['Timeout'].first.to_i).to be <= 300
    end
  end
end
describe 'configuration' do
  let(:config) { apache_conf.params }

  describe 'MaxClients' do
    it 'should be >= 256' do
      expect(config['MaxClients'].first.to_i).to be >= 256
    end
  end
end
describe 'configuration' do
  let(:config) { apache_conf.params }

  describe 'Listen' do
    it 'should be = 80' do
      expect(config['Listen'].first.to_i).to be == 80
    end
  end
end
