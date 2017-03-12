auth_dir = '/etc/mail/authinfo'

package ['sendmail', 'mailutils']

service 'sendmail' do
  action [:enable, :start]
end

directory auth_dir do
  owner 'root'
  group 'root'
  mode  '0700'
end

account = node['php_app']['sendmail']

execute 'makemap' do
  command "makemap hash #{account['name']} < #{account['name']}"
  cwd     auth_dir
  action  :nothing
end

file "#{auth_dir}/#{account['name']}" do
  content  "AuthInfo: \"U:#{account['user']}\" \"P:#{account['password']}\""
  owner    'root'
  group    'root'
  mode     '0700'
  notifies :run, 'execute[makemap]', :immediately
end

execute 'config' do
  command 'make -C /etc/mail'
  action  :nothing
end

template '/etc/mail/sendmail.mc' do
  source    'sendmail.mc.erb'
  owner     'root'
  group     'root'
  mode      '0644'
  notifies  :run, 'execute[config]', :immediately
  notifies  :reload, 'service[sendmail]', :delayed
  variables host: account['host'] || 'localhost',
            port: account['port'] || 25,
            name: account['name']
end
