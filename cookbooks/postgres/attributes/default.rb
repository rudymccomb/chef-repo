default['postgresql']['enable_pgdg_apt']      = true
default['postgresql']['enable_pgdg_yum']      = true
default['postgresql']['version']              = '9.6'
default['postgresql']['dir']                  = "/etc/postgresql/#{node['postgresql']['version']}/main"
default['postgresql']['password']['postgres'] = 'postgres'

default['postgresql']['client']['packages'] = [
  "postgresql-client-#{node['postgresql']['version']}",
  'libpq-dev'
]

default['postgresql']['server']['packages'] = [
  "postgresql-#{node['postgresql']['version']}"
]

default['postgresql']['contrib']['packages'] = [
  "postgresql-contrib-#{node['postgresql']['version']}"
]

default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil,            method: 'ident' },
  { type: 'local', db: 'all', user: 'all',      addr: nil,            method: 'md5' },
  { type: 'host',  db: 'all', user: 'postgres', addr: '127.0.0.1/32', method: 'md5' },
  { type: 'host',  db: 'all', user: 'postgres', addr: '::1/128',      method: 'md5' }
]
