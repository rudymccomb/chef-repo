include_recipe 'php_app::sendmail' if node['php_app']['use_sendmail']

php_fpm_pool 'default' do
  listen node['php_app']['listen']
end

package Array(node['php_app']['packages'])
