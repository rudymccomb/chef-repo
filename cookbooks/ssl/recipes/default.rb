include_recipe 'acme'
include_recipe 'ssl::directories'

Array(node['ssl']['sites']).each do |site|
  acme_certificate site['cn'] do
    cn        site['cn']
    alt_names Array(site['alt_names'])
    key       "#{node['ssl']['key_path']}/#{site['cn']}.key"
    fullchain "#{node['ssl']['crt_path']}/#{site['cn']}.bundle-crt"
    method    'http'
    wwwroot   node['ssl']['wwwroot']
    notifies  :reload, 'service[nginx]', :immediately
  end
end
