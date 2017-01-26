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

default['package-list'] = common + platform_specific[platform_family]

default['nodejs']['install_method'] = 'binary'
