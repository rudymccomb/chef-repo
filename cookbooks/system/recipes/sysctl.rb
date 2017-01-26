local_conf = '/etc/sysctl.d/99-local.conf'
memory     = node['memory']['total'].to_i

template local_conf do
  source    'sysctl-local.conf.erb'
  variables memory: memory
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :run, 'execute[sysctl]', :immediately
end

execute 'sysctl' do
  command "sysctl -p #{local_conf}"
  action  :nothing
end
