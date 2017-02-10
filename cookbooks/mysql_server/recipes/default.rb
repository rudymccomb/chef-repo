mysql_service 'default' do
  initial_root_password node['mysql_server']['initial_root_password']
  action [:create, :start]
end
