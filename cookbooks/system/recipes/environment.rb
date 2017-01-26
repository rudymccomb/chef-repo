if node['memory']['total'].to_i > 1024 * 1024
  cookbook_file '/etc/environment' do
    source 'environment'
    owner  'root'
    group  'root'
    mode   '0644'
  end
end
