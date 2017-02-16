include_recipe 'chef_nginx'

sites         = Array node['nginx']['sites'] || [{ 'name' => node['fqdn'] }]
config_dir    = node['nginx']['dir']
is_production = node['virtualization']['system'] != 'vbox'

if is_production
  openssl_dhparam "#{config_dir}/dhparams.pem" do
    key_length 2048
    notifies   :reload, 'service[nginx]', :delayed
    not_if     { File.exist? "#{config_dir}/dhparams.pem" }
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
