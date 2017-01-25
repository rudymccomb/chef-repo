default['fail2ban']['services'] = {
  'ssh' => {
    'enabled'  => 'true',
    'port'     => 'ssh',
    'filter'   => 'sshd',
    'logpath'  => node['fail2ban']['auth_log'],
    'maxretry' => '6'
  }
}
