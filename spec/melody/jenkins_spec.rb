require 'spec_helper'

# check installed packages
%w(jenkins java-1.7.0-openjdk wget firewalld initscripts).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# check if jenkins is enabled
describe service('jenkins') do
  it { should be_enabled }
end
