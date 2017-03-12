package 'sendmail' do
  action :install
end

service 'sendmail' do
  action [:enable, :start]
end
