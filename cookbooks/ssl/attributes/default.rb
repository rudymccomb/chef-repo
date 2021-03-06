default['ssl']['wwwroot']   = node['nginx']['www_dir'] || '/var/www'
default['ssl']['crt_path']  = '/etc/ssl/certs'
default['ssl']['key_path']  = '/etc/ssl/private'
default['ssl']['sites']     = [{ 'cn' => node['fqdn'] }]

default['acme']['renew']    = 30
default['acme']['key_size'] = 3072
default['acme']['contact']  = ['mailto:francocatena@gmail.com']
default['acme']['endpoint'] = 'https://acme-v01.api.letsencrypt.org'
