chef_ingredient 'chef-server' do
  action [:upgrade, :reconfigure]
  version :latest
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
