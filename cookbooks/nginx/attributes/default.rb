default['nginx']['www_dir']            = '/var/www'
default['nginx']['template']           = 'rack'
default['nginx']['sock_path']          = node['nginx']['template'] == 'rack' ? '/run/unicorn/unicorn.sock' : '/var/run/php-fpm.sock'
default['nginx']['long_proxy_timeout'] = false
