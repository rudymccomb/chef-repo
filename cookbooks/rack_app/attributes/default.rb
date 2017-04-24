default['rack_app']['ruby_version'] = '2.4.1'
default['rack_app']['user']         = 'deployer'
default['rack_app']['group']        = node['platform_family'] == 'rhel' ? 'nginx' : 'www-data'
default['rack_app']['base_dir']     = '/var/www/app'
default['rack_app']['rbenv_path']   = "/home/#{node['rack_app']['user']}/.rbenv"

default['rbenv']['user_installs'] = [
  {
    'user'      => node['rack_app']['user'],
    'rubies'    => [node['rack_app']['ruby_version']],
    'global'    => node['rack_app']['ruby_version'],
    'git_ref'   => node['rack_app']['rbenv_git_ref'] || 'master',
    'upgrade'   => true,
    'user_gems' => {
      node['rack_app']['ruby_version'] => [
        { 'name' => 'bundler' }
      ]
    }
  }
]
