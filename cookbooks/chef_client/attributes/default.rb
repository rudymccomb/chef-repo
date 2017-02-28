interval = node['roles'].include?('chef_server') ? 6 * 60 * 60 : 2 * 60 * 60

default['chef_client']['interval'] = interval
default['chef_client']['splay']    = 20 * 60 # plus _randomized_ 20 minutes
