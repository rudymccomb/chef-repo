mysql_connection_info = {
  host:     'localhost',
  username: 'root',
  password: node['mysql_server']['initial_root_password']
}

mysql_service 'default' do
  initial_root_password node['mysql_server']['initial_root_password']
  action [:create, :start]
end

Array(node['mysql_server']['databases']).each do |database|
  unless database['owner'] == 'root'
    mysql_database_user database['owner'] do
      connection mysql_connection_info
      password   database['password']
      action     :create
    end
  end

  mysql_database database['name'] do
    connection mysql_connection_info
    owner      database['owner']
    action     :create
  end
end
