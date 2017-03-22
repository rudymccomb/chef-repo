default['php_app']['listen']       = '/var/run/php-fpm.sock'
default['php_app']['use_sendmail'] = false
default['php_app']['user']         = if node['etc']['passwd']['deployer']
                                       'deployer'
                                     elsif node.platform_family? 'debian'
                                       'www-data'
                                     else
                                       'nginx'
                                     end
