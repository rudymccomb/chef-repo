default['node_app']['user']       = 'deployer'
default['node_app']['group']      = node['platform_family'] == 'rhel' ? 'nginx' : 'www-data'
default['node_app']['base_dir']   = '/var/www/app'
default['node_app']['node_path']  = '/usr/local/bin/node'
default['node_app']['entrypoint'] = "#{node['node_app']['base_dir']}/current/main.js"
