is_production = node['virtualization']['system'] != 'vbox'
units_path    = value_for_platform_family(
  'rhel'    => '/usr/lib/systemd/system',
  'default' => '/lib/systemd/system'
)
requires      = value_for_platform_family(
  'debian'  => node.recipe?('rack_app::sidekiq') ? ['redis-server.service'] : [],
  'default' => node.recipe?('rack_app::sidekiq') ? ['redis.service']        : []
)

execute 'systemctl' do
  command 'systemctl daemon-reload'
  action  :nothing
end

template "#{units_path}/unicorn.service" do
  source    'unicorn.service.erb'
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :run, 'execute[systemctl]', :immediately
  variables user:          node['rack_app']['user'],
            group:         node['rack_app']['group'],
            base_dir:      node['rack_app']['base_dir'],
            rbenv_root:    node['rack_app']['rbenv_path'],
            requires:      requires,
            is_production: is_production
end

service 'unicorn' do
  action :enable
end
