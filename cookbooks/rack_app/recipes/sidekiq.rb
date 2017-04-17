is_production = node['virtualization']['system'] != 'vbox'
units_path    = value_for_platform_family(
  'rhel'    => '/usr/lib/systemd/system',
  'default' => '/lib/systemd/system'
)

template "#{units_path}/sidekiq.service" do
  source    'sidekiq.service.erb'
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :run, 'execute[systemctl]', :immediately
  variables platform_family: node['platform_family'],
            user:            node['rack_app']['user'],
            group:           node['rack_app']['group'],
            base_dir:        node['rack_app']['base_dir'],
            rbenv_root:      node['rack_app']['rbenv_path'],
            is_production:   is_production
end

service 'sidekiq' do
  action :enable
end
