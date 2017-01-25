search(:users, "*:*").each do |user_data|
  login = user_data['id']
  home  = login == 'root' ? '/root' : "/home/#{login}"

  user login do
    shell       user_data['shell']
    comment     user_data['comment']
    home        home
    manage_home true
  end

  directory "#{home}/.ssh" do
    mode  '0700'
    owner login
  end

  file "#{home}/.ssh/authorized_keys" do
    mode    '0600'
    owner   login
    content user_data['ssh_keys'].join("\n")
  end
end
