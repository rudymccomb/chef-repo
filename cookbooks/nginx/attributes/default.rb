default['nginx']['template'] = 'rack'

sock = case node['nginx']['template']
       when 'rack'
        '/run/unicorn/unicorn.sock'
       when 'php'
         '/var/run/php-fpm.sock'
       when 'chef'
       else
         Chef::Application.fatal! 'Unsupported nginx template!'
       end

default['nginx']['default_site_enabled'] = false
default['nginx']['www_dir']              = '/var/www'
default['nginx']['sock_path']            = sock
default['nginx']['long_proxy_timeout']   = false

default['openssl']['restart_services']   = ['nginx']
