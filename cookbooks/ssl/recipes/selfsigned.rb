include_recipe 'acme'
include_recipe 'ssl::directories'

Array(node['ssl']['sites']).each do |site|
  ctr_root = "#{node['ssl']['crt_path']}/#{site['cn']}"

  execute "concat_#{site['cn']}" do
    action   :nothing
    command  "cat #{ctr_root}.crt #{ctr_root}.pem > #{ctr_root}.bundle-crt"
    creates  "#{ctr_root}.bundle-crt"
    notifies :reload, 'service[nginx]', :immediately
  end

  acme_selfsigned site['cn'] do
    key      "#{node['ssl']['key_path']}/#{site['cn']}.key"
    crt      "#{ctr_root}.crt"
    chain    "#{ctr_root}.pem"
    notifies :run, "execute[concat_#{site['cn']}]", :immediately
  end
end
