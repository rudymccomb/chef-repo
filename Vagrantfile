Vagrant.configure '2' do |config|
  config.vm.box               = 'debian/jessie64'
  config.omnibus.chef_version = :latest

  config.vm.network 'public_network'
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :chef_client do |chef|
    chef.node_name              = 'chef-test'
    chef.provisioning_path      = '/etc/chef'
    chef.chef_server_url        = 'https://api.chef.io/organizations/cirope'
    chef.validation_key_path    = '.chef/cirope-validator.pem'
    chef.validation_client_name = 'cirope-validator'
  end
end
