include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node['rack_app']['ruby_version'] do
  global true
end

rbenv_gem 'bundler' do
  ruby_version node['rack_app']['ruby_version']
end
