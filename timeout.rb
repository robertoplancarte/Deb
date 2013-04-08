sleep ARGV[1].to_i

begin
  Process.getpgid(ARGV[0].to_i)
  Process.kill("KILL",ARGV[0].to_i)
  puts "timeout! #{ARGV[0]}"
rescue Errno::ESRCH
  puts "timeout ok #{ARGV[0]}"
end
