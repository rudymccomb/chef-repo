interval = node.role?('chef_server') ? 6 * 60 * 60 : 2 * 60 * 60

default['chef_client']['version']  = '12.20.3'
default['chef_client']['interval'] = interval
default['chef_client']['splay']    = 20 * 60 # plus _randomized_ 20 minutes
