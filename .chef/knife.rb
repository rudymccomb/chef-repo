# See http://docs.chef.io/config_rb_knife.html

current_dir = File.dirname __FILE__

log_level              :info
log_location           STDOUT

node_name              "francocatena"

client_key             "#{current_dir}/francocatena.pem"
validation_client_name "cirope-validator"
validation_key         "#{current_dir}/cirope-validator.pem"

chef_server_url        "https://api.chef.io/organizations/cirope"

cache_type             "BasicFile"
cache_options          path: "#{ENV['HOME']}/.chef/checksums"

cookbook_copyright     "Cirope S.A."
cookbook_email         "francocatena@gmail.com"
cookbook_license       "mit"
cookbook_path          ["#{current_dir}/../cookbooks"]
