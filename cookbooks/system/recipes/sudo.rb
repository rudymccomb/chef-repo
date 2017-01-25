include_recipe 'sudo'

search(:users, 'deployer:true').each do |user_data|
  login = user_data['id']

  sudo login do
    template  'sudoers_deployer.erb'
    variables user: login
  end
end
