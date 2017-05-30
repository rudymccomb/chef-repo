if node['platform_family'] == 'rhel'
  selinux_install 'selinux'

  selinux_state 'disabled' do
    action :disabled
  end
end
