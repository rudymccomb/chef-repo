include_recipe 'chef-client'

chef_ingredient 'chef' do
  action :upgrade
end
