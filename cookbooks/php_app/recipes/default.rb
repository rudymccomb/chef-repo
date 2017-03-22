include_recipe 'php_app::sendmail' if node['php_app']['sendmail']

fpm_user = node['php_app']['user'] || value_for_platform_family(
  'debian'  => 'www-data',
  'default' => 'nginx'
)

php_fpm_pool 'default' do
  user   fpm_user
  listen node['php_app']['listen']
end

package Array(node['php_app']['packages'])
