include_recipe 'chef-client'

chef_ingredient 'chef' do
  action  :install
  version '12.19.36'
end
