include_recipe 'acme'
include_recipe 'ssl::directories'

Array(node['ssl']['sites']).each do |site|
  sans = Array(site['alt_names']).map do |prefix|
    "#{prefix}.#{site['cn']}"
  end

  acme_certificate site['cn'] do
    cn        site['cn']
    alt_names sans
    key       "#{node['ssl']['key_path']}/#{site['cn']}.key"
    fullchain "#{node['ssl']['crt_path']}/#{site['cn']}.bundle-crt"
    wwwroot   node['ssl']['wwwroot']
    notifies  :reload, 'service[nginx]', :immediately
  end
end
