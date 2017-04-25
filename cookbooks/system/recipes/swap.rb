memory                = node['memory']['total']
current_swap_size     = node['memory']['swap']['total']
current_swap_in_bytes = current_swap_size.to_i * 1024
current_swap_in_mb    = (current_swap_in_bytes.to_f / 1_048_576).ceil
swap_size_in_mb       = node['swap']['size_in_mb'] - current_swap_in_mb

unless [current_swap_size, memory].all? { |m| m.end_with?('kB') }
  Chef::Application.fatal! 'Unsupported platform, memory should be on kB!'
end

if swap_size_in_mb > 0
  swap_file node['swap']['path'] do
    size    swap_size_in_mb
    persist node['swap']['persist']
  end
end
