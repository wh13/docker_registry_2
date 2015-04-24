default['registry_2']['path'] = "/var/app"

default['registry_2']['domain'] = 'registry.domain'
default['registry_2']['tls']['name'] = "registry2"
default['registry_2']['tls']['common_name'] = 'Common name'
default['registry_2']['tls']['org'] = 'Org name'
default['registry_2']['tls']['org_unit'] = 'Org unit'
default['registry_2']['tls']['country'] = 'US'


default['registry_2']['compose_file'] = "#{node['registry_2']['path']}/docker-compose.yml"

default['registry_2']['registry']['path'] = "#{node['registry_2']['path']}/registry"
default['registry_2']['registry']['docker_file'] = "#{node['registry_2']['registry']['path']}/Dockerfile"

default['registry_2']['registry']['config_file'] = "#{node['registry_2']['registry']['path']}/config.yml"

default['registry_2']['nginx']['configs_dir'] = "#{node['registry_2']['path']}/nginx"
default['registry_2']['nginx']['host_file'] = "#{node['registry_2']['nginx']['configs_dir']}/registry.conf.erb"
default['registry_2']['nginx']['config_file'] = "#{node['registry_2']['nginx']['configs_dir']}/nginx.conf.erb"
default['registry_2']['nginx']['docker_file'] = "#{node['registry_2']['nginx']['configs_dir']}/Dockerfile"
default['registry_2']['nginx']['passwd_dir'] = "#{node['registry_2']['nginx']['configs_dir']}/auth"
default['registry_2']['nginx']['passwd_file'] = "#{node['registry_2']['nginx']['passwd_dir']}/registry_passwd"

default['registry_2']['nginx']['passwords'] = {}


default['registry_2']['tls']['key_file'] = "#{node['registry_2']['nginx']['configs_dir']}/#{node['registry_2']['tls']['name']}.key"
default['registry_2']['tls']['cert_file'] = "#{node['registry_2']['nginx']['configs_dir']}/#{node['registry_2']['tls']['name']}.pem"


default['registry_2']['storage']['directory'] = "#{node['registry_2']['path']}/storage"

default['registry_2']['nginx']['dir'] = "#{node['registry_2']['nginx']['configs_dir']}/www"
default['registry_2']['nginx']['index'] = "#{node['registry_2']['nginx']['dir']}/index.html"
