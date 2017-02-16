include_recipe 'iptables'

iptables_rule 'all_established'
iptables_rule 'all_icmp'
iptables_rule 'prefix'
iptables_rule 'postfix'

iptables_rule 'ssh'

if node['roles'].include?('web') || node['roles'].include?('chef_server')
  iptables_rule 'http'
  iptables_rule 'https'
end

include_recipe 'fail2ban'
