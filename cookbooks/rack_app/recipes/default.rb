include_recipe 'rack_app::rbenv'
include_recipe 'rack_app::unicorn'
include_recipe 'rack_app::logrotate'

Array(node['rack_app']['recipes']).each do |recipe|
  include_recipe recipe
end

directory node['rack_app']['base_dir'] do
  owner     node['rack_app']['user']
  group     node['rack_app']['group']
  mode      '0755'
  recursive true
end
