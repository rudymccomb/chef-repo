include_recipe 'postgresql::client'
include_recipe 'postgresql::server'
include_recipe 'postgresql::contrib'
include_recipe 'postgresql::config_pgtune'
include_recipe 'database::postgresql'

postgresql_connection_info = {
  host:     'localhost',
  port:     node['postgresql']['config']['port'],
  username: 'postgres',
  password: node['postgresql']['password']['postgres']
}

Array(node['postgresql']['databases']).each do |database|
  postgresql_database_user database['owner'] do
    connection postgresql_connection_info
    password   database['password']
    action     :create
  end

  postgresql_database database['name'] do
    connection postgresql_connection_info
    owner      database['owner']
    action     :create
  end
end
