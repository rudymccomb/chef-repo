platform_family = node['platform_family']

common = [
  'bzip2',
  'curl',
  'hdparm',
  'htop',
  'nmap',
  'tmux',
  'unzip',
  'wget',
  'zsh'
]

platform_specific = {
  'arch' => [
    'libffi'
  ],
  'debian' => [
    'libffi-dev'
  ],
  'rhel' => [
    'libffi-devel'
  ]
}

default['package-list'] = common + platform_specific[platform_family]
