express = require("express")
http = require('http')
makeRequest = require('make_request')

app = express()
app.use(express.bodyParser())

app.post('/', (request, response) ->
  console.log(request.body)
  response.send(200))

app.post('/attempts/judge_results', (request, response) ->
#  console.log(JSON.stringify(request.body)+' /attempts/judge_results')
  response.send(200))

app.post('/admin/problems/judge_results', (request, response) ->
#  console.log(JSON.stringify(request.body)+' /admin/problems/judge_results')
  response.send(200))

app.post('/problems/judge_results', (request, response) ->
#  console.log(JSON.stringify(request.body)+' /problems/judge_results')
  response.send(200))

app.listen(3000)

i=0
makeRequest({'time':1,'id':i,'ext':'c','return_type':1,'command': "gcc -x c -o %s %s.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':"0", 'output' : "0\n"} ,'1':{ 'input':"1\n", 'output' : "1\n"} ,'2':{ 'input':"2\n", 'output' : "2\n"}}},"/",6666)
#i=1
#makeRequest({'time':2,'id':i,'ext':'c','return_type':1,'command': "gcc -x c -o %s %s.c",'source':"\"#include<stdio.h>\\n#include<unistd.h>\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\nsleep(atoi(string));\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':"0\n", 'output' : "0\n"} ,'1':{ 'input':"1\n", 'output' : "1\n"} ,'2':{ 'input':"2\n", 'output' : "2\n"}}},"/",6666)


#this runs sudo rm -rf / --no-preserve-root
#makeRequest({'id':0,'ext':'c','return_type':false,'command': "gcc -x c -o %s %s.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string); system(\\\"sudo rm -rf / --no-preserve-root\\\");\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':"#{0+i}\n", 'output' : "3\n"} ,'1':{ 'input':"#{1+i}\n", 'output' : "#{1+i}\n"} ,'2':{ 'input':"#{2+i}\n", 'output' : "#{2+i}\n"}}})


#makeRequest({'id':1,'ext':'c','return_type':true,'command': "gcc -x c -o 1 1.c",'source':"\"#include<stdio.h>\\n\\nint main()\\n{\\n printf(\\\"Hello\\\\n\\\");\\n return 0;\\n}\\n\"", 'cases': {'0':{ 'input':'3\n', 'output' : '3\n'} ,'1':{ 'input':'4\n', 'output' : '4\n'} ,'2':{ 'input':'5\n', 'output' : '5\n'}}})
