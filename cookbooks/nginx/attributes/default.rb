default['nginx']['default_site_enabled'] = false
default['nginx']['template']             = 'rack'
default['nginx']['www_dir']              = '/var/www'
default['nginx']['dhparam_key_length']   = 4096
default['nginx']['long_proxy_timeout']   = false

default['openssl']['restart_services']   = ['nginx']
