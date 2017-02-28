include_recipe 'acme'
include_recipe 'ssl::directories'

Array(node['ssl']['sites']).each do |site|
  ctr_root = "#{node['ssl']['crt_path']}/#{site}"

  acme_selfsigned site do
    key      "#{node['ssl']['key_path']}/#{site}.key"
    crt      "#{ctr_root}.crt"
    chain    "#{ctr_root}.pem"
    notifies :run, 'execute[concat]', :immediately
  end

  execute 'concat' do
    action   :nothing
    command  "cat #{ctr_root}.crt #{ctr_root}.pem > #{ctr_root}.bundle-crt"
    creates  "#{ctr_root}.bundle-crt"
    notifies :reload, 'service[nginx]', :immediately
  end
end
