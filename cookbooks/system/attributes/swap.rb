memory             = node['memory']['total']
memory_in_bytes    = memory.to_i * 1024
swap_size_in_bytes = if memory_in_bytes <= 2_147_483_648    # 2 GB
                       memory_in_bytes * 2
                     elsif memory_in_bytes <= 8_589_934_592 # 8 GB
                       memory_in_bytes
                     else
                       (memory_in_bytes.to_f / 2).ceil
                     end

default['swap']['path']       = '/swapfile0'
default['swap']['size_in_mb'] = (swap_size_in_bytes.to_f / 1_048_576).ceil
default['swap']['persist']    = true
