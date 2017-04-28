include_recipe 'chef_nginx'
include_recipe 'openssl::upgrade'

sites          = Array node['nginx']['sites'] || [{ 'name' => node['fqdn'] }]
config_dir     = node['nginx']['dir']
is_production  = node['virtualization']['system'] != 'vbox'
default_server = {
  'rack' =>  'unix:/run/unicorn/unicorn.sock',
  'node' =>  'http://127.0.0.1:8080',
  'php'  =>  'unix:/var/run/php-fpm.sock'
}

if is_production
  openssl_dhparam "#{config_dir}/dhparams.pem" do
    key_length 4096
    notifies   :reload, 'service[nginx]', :delayed
    not_if     { File.exist? "#{config_dir}/dhparams.pem" }
  end
end

sites.each_with_index do |site, i|
  template = site['template'] || node['nginx']['template']
  server   = site['server']   || default_server[template]
  site_dir = site['site_dir'] || "#{node['nginx']['www_dir']}/#{site['name']}"

  nginx_site site['name'] do
    template  is_production ? 'vhost_ssl.erb' : 'vhost.erb'
    variables site:               site['name'],
              dataroot:           site['dataroot'],
              rewrite:            site['rewrite'],
              www_dir:            node['nginx']['www_dir'],
              long_proxy_timeout: node['nginx']['long_proxy_timeout'],
              disable_hsts:       node['nginx']['disable_hsts'],
              site_dir:           site_dir,
              template:           template,
              server:             server,
              deferred:           i == 0
  end
end
