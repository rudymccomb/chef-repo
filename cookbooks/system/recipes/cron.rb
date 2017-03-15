Array(node['system']['cron_entries']).each do |entry|
  cron entry['name'] do
    command entry['command']
    minute  entry['minute']
    hour    entry['hour']
    weekday entry['weekday']
    day     entry['day']
    month   entry['month']
  end
end
