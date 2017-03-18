chef_ingredient 'manage' do
  action   :install
  version  '2.4.5'
  config   'disable_sign_up true'
  notifies :reconfigure, 'chef_ingredient[chef-server]', :immediately
end

chef_ingredient 'manage' do
  action         :reconfigure
  accept_license true
end
