default['ssl']['wwwroot']   = node['nginx']['www_dir'] || '/var/www'
default['ssl']['crt_path']  = '/etc/ssl/certs'
default['ssl']['key_path']  = '/etc/ssl/private'
default['ssl']['sites']     = [node['fqdn']]

default['acme']['contact']  = ['mailto:francocatena@gmail.com']
default['acme']['endpoint'] = 'https://acme-v01.api.letsencrypt.org'
