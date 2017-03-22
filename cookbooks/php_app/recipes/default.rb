include_recipe 'php_app::sendmail' if node['php_app']['sendmail']

php_fpm_pool 'default' do
  user   node['php_all']['user']
  listen node['php_app']['listen']
end

package Array(node['php_app']['packages'])
