chef_ingredient 'manage' do
  action         :upgrade
  version        node['chef_server']['manage_version']
  config         'disable_sign_up true'
  accept_license true
end

ingredient_config 'manage' do
  notifies :reconfigure, 'chef_ingredient[manage]'
end
