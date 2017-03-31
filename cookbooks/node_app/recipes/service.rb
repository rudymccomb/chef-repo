units_path = value_for_platform_family(
  'rhel'    => '/usr/lib/systemd/system',
  'default' => '/lib/systemd/system'
)

execute 'systemctl' do
  command 'systemctl daemon-reload'
  action  :nothing
end

template "#{units_path}/node.service" do
  source    'node.service.erb'
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :run, 'execute[systemctl]', :immediately
  variables user:       node['node_app']['user'],
            group:      node['node_app']['group'],
            base_dir:   node['node_app']['base_dir'],
            node_path:  node['node_app']['node_path'],
            entrypoint: node['node_app']['entrypoint'],
            env:        Array(node['node_app']['env']),
            requires:   Array(node['node_app']['requires'])
end

service 'node' do
  action :enable
end
