case node['platform_family']
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
  include_recipe 'yum-epel'
else
  Chef::Application.fatal! 'Unsupported platform family!'
end

include_recipe 'build-essential'
include_recipe 'git'
include_recipe 'ntp'
include_recipe 'vim'

Array(node['package-list']).each do |package_name|
  package package_name
end
