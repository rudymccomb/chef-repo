include_recipe 'chef-client'

chef_ingredient 'chef' do
  action   :upgrade
  version  node['chef_client']['version']
  notifies :restart, 'service[chef-client]', :delayed
end
