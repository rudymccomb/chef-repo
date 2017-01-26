unless node['memory']['total'].upcase.end_with?('KB')
  Chef::Application.fatal! 'Memory not expresed on kB, aborting!'
end
