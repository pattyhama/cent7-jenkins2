require 'spec_helper'

# Check installed packages
%w(jenkins java-1.7.0-openjdk wget firewalld initscripts).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Check if jenkins is running/enabled
describe service('jenkins') do
  it { should be_running }
  it { should be_enabled }
end
