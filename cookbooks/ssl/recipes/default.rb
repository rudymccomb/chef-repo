include_recipe 'acme'
include_recipe 'ssl::directories'

Array(node['ssl']['sites']).each do |site|
  acme_certificate site do
    cn        site
    key       "#{node['ssl']['key_path']}/#{site}.key"
    fullchain "#{node['ssl']['crt_path']}/#{site}.bundle-crt"
    method    'http'
    wwwroot   node['ssl']['wwwroot']
    notifies  :reload, 'service[nginx]', :immediately
  end
end
