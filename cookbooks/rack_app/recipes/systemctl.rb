execute 'systemctl' do
  command 'systemctl daemon-reload'
  action  :nothing
end
