case node['platform_family']
when 'debian'
  include_recipe 'apt'
when 'rhel'
  include_recipe 'yum'
  include_recipe 'yum-epel'
else
  Chef::Application.fatal! 'Unsupported platform family!'
end
