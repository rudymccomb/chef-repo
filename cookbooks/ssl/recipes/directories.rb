key_path_group = value_for_platform_family(
  'debian'  => 'ssl-cert',
  'default' => 'root'
)

if node.platform_family?('debian')
  group 'ssl-cert'
end

directory node['ssl']['crt_path'] do
  owner 'root'
  group 'root'
  mode  '0755'
end

directory node['ssl']['key_path'] do
  owner 'root'
  group key_path_group
  mode  '0710'
end

