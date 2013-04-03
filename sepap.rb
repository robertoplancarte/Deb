require 'net/http'
require 'json'

@host = '192.168.33.10'
@port = '8000'

i=10
@payload ={'id'=>i,'attempt_ext'=>'c','compare'=>false,'command'=> "gcc -x c -o %s %s.c",'source'=>"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"", 'cases'=> {'0'=>{ 'input'=>"#{0+i}\n", 'output' => "3\n"} ,'1'=>{ 'input'=>"#{1+i}\n", 'output' => "#{1+i}\n"} ,'2'=>{ 'input'=>"#{2+i}\n", 'output' => "#{2+i}\n"}}}.to_json

def post
  req = Net::HTTP::Post.new("/", initheader = {'Content-Type' =>'application/json'})
  req.body = @payload
  response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
end

post()
