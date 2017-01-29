template "/etc/logrotate.d/#{node['rack_app']['name']}" do
  source    'logrotate.erb'
  owner     'root'
  group     'root'
  mode      '0644'
  variables base_dir: node['rack_app']['base_dir']
end
