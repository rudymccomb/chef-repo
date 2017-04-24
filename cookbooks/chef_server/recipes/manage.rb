chef_ingredient 'manage' do
  action         :upgrade
  version        '2.5.1'
  config         'disable_sign_up true'
  accept_license true
end

ingredient_config 'manage' do
  notifies :reconfigure, 'chef_ingredient[chef-server]'
end
