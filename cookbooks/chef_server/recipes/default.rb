config_options = [
  "api_fqdn '#{node['fqdn']}'",
  "nginx['ssl_certificate']     = '/etc/ssl/certs/#{node['fqdn']}.bundle-crt'",
  "nginx['ssl_certificate_key'] = '/etc/ssl/private/#{node['fqdn']}.key'",
]

if node['roles'].include?('web')
  config_options << "nginx['non_ssl_port'] = 8080"
  config_options << "nginx['ssl_port']     = 8443"
end

chef_ingredient 'chef-server' do
  action  [:upgrade, :reconfigure]
  version :latest
  config  config_options.join("\n")
end

ingredient_config 'chef-server' do
  notifies :reconfigure, 'chef_ingredient[chef-server]'
end

chef_ingredient 'manage' do
  action :install
  notifies :reconfigure, 'chef_ingredient[chef-server]', :immediately
end

chef_ingredient 'manage' do
  action :reconfigure
  accept_license true
end

chef_ingredient 'push-jobs-server' do
  action :install
  notifies :reconfigure, 'chef_ingredient[chef-server]', :immediately
end

chef_ingredient 'push-jobs-server' do
  action :reconfigure
end
