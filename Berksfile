source 'https://supermarket.chef.io'

Dir['cookbooks/*/Berksfile'].each do |berksfile_path|
  cookbook_name = berksfile_path.split('/')[1]

  cookbook cookbook_name, path: "cookbooks/#{cookbook_name}"
end
