# coding : utf-8
require 'serverspec'
require 'docker'

# set backend as docker
set :backend, :docker

# set docker_url as DOCKER_HOST
set :docker_url, ENV['DOCKER_HOST']
set :docker_image, ENV['TARGET_CONTAINER_ID']

# disable ssl (TODO https://github.com/swipely/docker-api/issues/202)
Excon.defaults[:ssl_verify_peer] = false

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    raise 'highline is not available. Try installing it.'
  end
  set :sudo_password, ask('Enter sudo password: ') { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
