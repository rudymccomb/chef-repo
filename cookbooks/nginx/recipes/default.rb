include_recipe 'chef_nginx'

sites         = Array node['nginx']['sites'] || [{ 'name' => node['fqdn'] }]
config_dir    = node['nginx']['dir']
is_production = node['virtualization']['system'] != 'vbox'

if is_production
  execute 'create 2048 dhparams' do
    command  "openssl dhparam -out #{config_dir}/dhparams.pem 2048"
    creates  "#{config_dir}/dhparams.pem"
    notifies :reload, 'service[nginx]', :delayed
  end
end

sites.each do |site|
  nginx_site site['name'] do
    template  is_production ? 'vhost_ssl.erb' : 'vhost.erb'
    variables site:               site['name'],
              template:           node['nginx']['template'],
              www_dir:            node['nginx']['www_dir'],
              sock:               node['nginx']['sock_path'],
              long_proxy_timeout: node['nginx']['long_proxy_timeout']
  end
end
