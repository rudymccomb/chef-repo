if node['platform'] == 'debian'
  execute 'locale-gen' do
    action :nothing
  end

  cookbook_file '/etc/locale.gen' do
    source   'locale.gen'
    owner    'root'
    group    'root'
    mode     '0644'
    notifies :run, 'execute[locale-gen]', :immediately
  end
end

include_recipe 'locale'
