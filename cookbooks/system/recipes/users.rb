deployer_group = value_for_platform_family(
  'rhel'    => 'nginx',
  'default' => 'www-data'
)

group deployer_group

search(:users, "*:*").each do |user_data|
  login = user_data['id']
  home  = login == 'root' ? '/root' : "/home/#{login}"
  group = user_data['deployer'] && deployer_group

  ohai 'reload' do
    action :nothing
    plugin 'etc'
  end

  user login do
    group       user_data['group'] || group
    shell       user_data['shell']
    comment     user_data['comment']
    home        home
    notifies    :reload, 'ohai[reload]', :immediately
    manage_home true
  end

  group = node['etc']['passwd'][login] && node['etc']['passwd'][login]['gid']

  %w(.ssh .vim .vim/backup .vim/undodir).each do |dir|
    directory "#{home}/#{dir}" do
      owner login
      group group
      mode  '0700'
    end
  end

  file "#{home}/.ssh/authorized_keys" do
    owner   login
    group   group
    mode    '0600'
    content user_data['ssh_keys'].join("\n")
  end

  git "#{home}/.oh-my-zsh" do
    repository 'https://github.com/robbyrussell/oh-my-zsh.git'
    user       login
    group      group
    action     :checkout
  end

  %w(gemrc irbrc tmux.conf vimrc zshrc).each do |dotfile|
    cookbook_file "#{home}/.#{dotfile}" do
      source "dotfiles/#{dotfile}"
      owner  login
      group  group
      mode   '0644'
    end
  end
end
