config_options = [
  "api_fqdn                       '#{node['fqdn']}'",
  "nginx['ssl_certificate']     = '/etc/ssl/certs/#{node['fqdn']}.bundle-crt'",
  "nginx['ssl_certificate_key'] = '/etc/ssl/private/#{node['fqdn']}.key'"
]

if node.role?('web')
  config_options << "bookshelf['vip_port'] = 8443"
  config_options << "nginx['non_ssl_port'] = 8080"
  config_options << "nginx['ssl_port']     = 8443"
end

chef_ingredient 'chef-server' do
  action  :upgrade
  version '12.14.0'
  config  config_options.join("\n")
end

ingredient_config 'chef-server' do
  notifies :reconfigure, 'chef_ingredient[chef-server]'
end
