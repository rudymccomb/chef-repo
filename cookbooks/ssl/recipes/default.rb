include_recipe 'acme'
include_recipe 'ssl::directories'

acme_certificate node['fqdn'] do
  cn        node['fqdn']
  key       "#{node['ssl']['key_path']}/#{node['fqdn']}.key"
  fullchain "#{node['ssl']['crt_path']}/#{node['fqdn']}.bundle-crt"
  method    'http'
  wwwroot   node['ssl']['wwwroot']
  notifies  :reload, 'service[nginx]', :immediately
end
