units_path = value_for_platform_family(
  'rhel'    => '/usr/lib/systemd/system',
  'default' => '/lib/systemd/system'
)

execute 'systemctl' do
  command 'systemctl daemon-reload'
  action  :nothing
end

Array(node['node_app']['apps']).each do |app|
  template "#{units_path}/#{app['name']}.service" do
    source    'node.service.erb'
    owner     'root'
    group     'root'
    mode      '0644'
    notifies  :run, 'execute[systemctl]', :immediately
    variables user:       app['user']       || node['node_app']['user'],
              group:      app['group']      || node['node_app']['group'],
              base_dir:   app['base_dir']   || node['node_app']['base_dir'],
              entrypoint: app['entrypoint'] || node['node_app']['entrypoint'],
              node_path:  node['node_app']['node_path'],
              env:        Array(app['env']      || node['node_app']['env']),
              requires:   Array(app['requires'] || node['node_app']['requires'])
  end

  service app['name'] do
    action :enable
  end
end
