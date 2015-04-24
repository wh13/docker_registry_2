#
# Cookbook Name:: docker_registry_2
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'digest/sha1'
require 'base64'


include_recipe "docker"
include_recipe "docker::compose"

directory node['registry_2']['path'] do
  action :create
end

directory node['registry_2']['storage']['directory'] do
  action :create
  recursive true
end

directory "#{node['registry_2']['nginx']['configs_dir']}" do
  action :create
  recursive true
end

openssl_x509 node["registry_2"]["tls"]["cert_file"] do
  common_name node["registry_2"]["tls"]["common_name"]
  org node["registry_2"]["tls"]["org"]
  org_unit node["registry_2"]["tls"]["org_unit"]
  country node["registry_2"]["tls"]["country"]
end



template "#{node["registry_2"]["compose_file"]}" do
  source "docker-compose.yml.erb"
end


# Registry image configuration
directory node['registry_2']['registry']['path'] do
  recursive true
  action :create
end

# template "#{node['registry_2']['registry']['path']}/Dockerfile" do
#   source "Dockerfile.registry.erb"
# end

template "#{node['registry_2']['registry']['config_file']}" do
  source "config.yml.erb"
end



# Nginx image configuration
template "#{node['registry_2']['nginx']['config_file']}" do
  source "nginx.conf.erb"
end

template "#{node['registry_2']['nginx']['host_file']}" do
  source "registry.conf.erb"
end

template "#{node["registry_2"]["nginx"]["docker_file"]}" do
  source "Dockerfile.erb"
end

directory node['registry_2']['nginx']['dir'] do
  action :create
  recursive true
end

directory node['registry_2']['nginx']['passwd_dir'] do
  action :create
  recursive true
end


cookbook_file "#{node['registry_2']['nginx']['index']}" do
  source "index.html"
end



items = node['registry_2']['nginx']['passwords'].map { |username, password|
  [username, '{SHA}' + Base64.encode64(Digest::SHA1.digest(password))]
}


template "#{node['registry_2']['nginx']['passwd_file']}" do
  source "passwd"
  variables(
            :items => items
            )
end

# docker_image 'registry:2.0' do
#   action :pull
# end

# docker_image 'nginx' do
#   action :pull
# end


docker_image "nginx:ready" do
  action :remove
end

docker_image "nginx:ready" do
  source "#{node["registry_2"]["nginx"]["configs_dir"]}"
  action :build
end

docker_image "registry:ready" do
  action :remove
end

docker_image "registry:ready" do
  source "#{node["registry_2"]["registry"]["path"]}"
  action :build
end


bash 'Run containers' do
  user 'root'
  cwd "#{node['registry_2']['path']}"
  code <<-EOH
   sudo docker-compose up -d
  EOH
end
