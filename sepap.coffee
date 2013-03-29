express = require("express")
http = require('http')
makeRequest = require('make_request')

app = express()
app.use(express.bodyParser())
app.post('/', (request, response) ->
  console.log(request.body)
  response.send(200))
app.listen(3000)

for i in [1...2]
  makeRequest({'attempt_id':i,'attempt_ext':'c','compare':true,'command': "gcc -x c -o %s %s.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':"#{0+i}\n", 'output' : "3\n"} ,'1':{ 'input':"#{1+i}\n", 'output' : "#{1+i}\n"} ,'2':{ 'input':"#{2+i}\n", 'output' : "#{2+i}\n"}}})

makeRequest({'attempt_id':0,'attempt_ext':'c','compare':false,'command': "gcc -x c -o %s %s.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':"#{0+i}\n", 'output' : "3\n"} ,'1':{ 'input':"#{1+i}\n", 'output' : "#{1+i}\n"} ,'2':{ 'input':"#{2+i}\n", 'output' : "#{2+i}\n"}}})


#makeRequest({'attempt_id':1,'attempt_ext':'c','compare':true,'command': "gcc -x c -o 1 1.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n printf(\\\"Hello\\\\n\\\");\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':'3\n', 'output' : '3\n'} ,'1':{ 'input':'4\n', 'output' : '4\n'} ,'2':{ 'input':'5\n', 'output' : '5\n'}}})
