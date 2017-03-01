default['nginx']['default_site_enabled'] = false
default['nginx']['template']             = 'rack'
default['nginx']['www_dir']              = '/var/www'
default['nginx']['long_proxy_timeout']   = false

default['openssl']['restart_services']   = ['nginx']
