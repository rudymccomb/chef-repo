include_recipe 'acme'
include_recipe 'ssl::directories'

ctr_root = "#{node['ssl']['crt_path']}/#{node['fqdn']}"

acme_selfsigned node['fqdn'] do
  key      "#{node['ssl']['key_path']}/#{node['fqdn']}.key"
  crt      "#{ctr_root}.crt"
  chain    "#{ctr_root}.pem"
  notifies :run, 'execute[concat]', :immediately
end

execute 'concat' do
  action   :nothing
  command  "cat #{ctr_root}.crt #{ctr_root}.pem > #{ctr_root}.bundle-crt"
  creates  "#{ctr_root}.bundle-crt"
  notifies :reload, 'service[nginx]', :immediately
end
