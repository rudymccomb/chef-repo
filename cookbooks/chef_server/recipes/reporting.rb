chef_server = "https://#{node['fqdn']}"

chef_ingredient 'reporting' do
  action                              :upgrade
  platform_version_compatibility_mode true
  notifies                            :reconfigure, 'chef_ingredient[chef-server]', :immediately
end

chef_ingredient 'reporting' do
  action         :reconfigure
  accept_license true
end
