chef_server = "https://#{node['fqdn']}"

chef_ingredient 'reporting' do
  action         :upgrade
  version        node['chef_server']['reporting_version']
  accept_license true
end

ingredient_config 'reporting' do
  notifies :reconfigure, 'chef_ingredient[reporting]'
end
