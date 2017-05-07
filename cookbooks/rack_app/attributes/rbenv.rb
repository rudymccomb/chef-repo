default['ruby_build']['upgrade']  = true

default['rbenv']['user_installs'] = [
  {
    'user'    => node['rack_app']['user'],
    'rubies'  => [node['rack_app']['ruby_version']],
    'global'  => node['rack_app']['ruby_version'],
    'git_ref' => node['rack_app']['rbenv_git_ref'] || 'master',
    'upgrade' => true,
    'gems'    => {
      node['rack_app']['ruby_version'] => [
        { 'name' => 'bundler' }
      ]
    }
  }
]
