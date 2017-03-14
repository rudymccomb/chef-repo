directory node['ssl']['crt_path'] do
  owner 'root'
  group 'root'
  mode  '0755'
end

directory node['ssl']['key_path'] do
  owner 'root'
  group 'root'
  mode  '0710'
end

