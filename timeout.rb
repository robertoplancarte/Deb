sleep ARGV[1].to_i
begin
  Process.kill("SIGTERM",ARGV[0].to_i)
  puts 1
rescue Errno::ESRCH
  puts 0
end
