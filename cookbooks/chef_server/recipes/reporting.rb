chef_server = "https://#{node['fqdn']}"

chef_ingredient 'reporting' do
  action         :upgrade
  version        '1.7.1'
  accept_license true
end

ingredient_config 'reporting' do
  notifies :reconfigure, 'chef_ingredient[reporting]'
end
