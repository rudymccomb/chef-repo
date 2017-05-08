include_recipe 'chef-client'

chef_ingredient 'chef' do
  action  :upgrade
  version '12.20.3'
end
