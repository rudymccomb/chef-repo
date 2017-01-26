redis = value_for_platform_family(
  'debian'  => 'redis-server',
  'default' => 'redis'
)

package redis

service redis do
  action [:enable, :start]
end
