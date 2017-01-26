if node['platform'] == 'debian'
  cookbook_file '/etc/locale.gen' do
    source   'locale.gen'
    owner    'root'
    group    'root'
    mode     '0644'
    notifies :run, 'execute[locale-gen]', :immediately
  end

  execute 'locale-gen' do
    action :nothing
  end
end

include_recipe 'locale'
