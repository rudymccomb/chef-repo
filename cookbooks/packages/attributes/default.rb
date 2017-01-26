platform_family = node['platform_family']

common = [
  'bzip2',
  'curl',
  'hdparm',
  'htop',
  'nmap',
  'tmux',
  'tzdata',
  'unzip',
  'wget',
  'zsh'
]

platform_specific = {
  'arch' => [
    'libffi'
  ],
  'debian' => [
    'libffi-dev',
    'locales'
  ],
  'rhel' => [
    'libffi-devel'
  ]
}

platform_list = platform_specific[platform_family]
node_list     = node['packages']['list'] && node['packages']['list'][platform_family]

default['package-list'] = common + platform_list + Array(node_list)

default['nodejs']['install_method'] = 'binary'
