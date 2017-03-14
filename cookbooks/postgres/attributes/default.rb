default['postgresql']['enable_pgdg_apt']      = true
default['postgresql']['enable_pgdg_yum']      = true
default['postgresql']['config']['ssl']        = false
default['postgresql']['version']              = '9.6'
default['postgresql']['dir']                  = "/etc/postgresql/#{node['postgresql']['version']}/main"
default['postgresql']['password']['postgres'] = 'postgres'

default['postgresql']['pg_hba'] = [
  { type: 'local', db: 'all', user: 'postgres', addr: nil,            method: 'ident' },
  { type: 'local', db: 'all', user: 'all',      addr: nil,            method: 'md5' },
  { type: 'host',  db: 'all', user: 'postgres', addr: '127.0.0.1/32', method: 'md5' },
  { type: 'host',  db: 'all', user: 'postgres', addr: '::1/128',      method: 'md5' }
]

case node['platform_family']
when 'debian'
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
when 'rhel'
  version = node['postgresql']['version'].split('.').join

  default['postgresql']['setup_script']           = "postgresql#{version}-setup"
  default['postgresql']['server']['service_name'] = "postgresql-#{node['postgresql']['version']}"
  default['postgresql']['client']['packages']     = ['postgresql-devel', "postgresql#{version}-devel"]
  default['postgresql']['server']['packages']     = ["postgresql#{version}-server"]
  default['postgresql']['contrib']['packages']    = ["postgresql#{version}-contrib"]
else
  Chef::Application.fatal! 'Unsupported platform family!'
end

