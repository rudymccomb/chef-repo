include_recipe 'packages::repos'

include_recipe 'build-essential'
include_recipe 'git'
include_recipe 'ntp'
include_recipe 'nodejs'
include_recipe 'vim'

package Array(node['package-list'])

Array(node['packages']['recipes']).each do |recipe|
  include_recipe recipe
end
