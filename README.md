Deb
====
Judge, jury and executioner of the SEPAP sistem
------------------------------------------------


This sistem is written in Nodejs, it listens for requests on port 6666 and responds to port 3000 of localhost

It uses 4 modules to work:

1. express

2. compiler

3. make_request

4. runner

Express
---------
Used to parse JSON requests, this dependency might be removed in later versions

this is what Deb expects in the JSON:

```json
{ "id":i,
  "ext":"c",
  "return_type":0,
  "command": "gcc -x c -o %s %s.c",
  "callback_url":"attempts/1/cases/1/results"
  "source":"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"",
  "cases":{ "0":{ "input":"#{0+i}\n", "output" : "3\n"},
            "1":{ "input":"#{1+i}\n", "output" : "#{1+i}\n"},
            "2":{ "input":"#{2+i}\n", "output" : "#{2+i}\n"}
          }
}
```

Compiler
---------
Writes the JSON"s source to a file named after the JSON"s id, compiles it and calls the runner module in it"s callback.
If Compiler couldn't compile the attempt it returns a request to port 3000 with the following JSON:

```json
{ "id":json.id,
  "error":error,
  "message":"#{json.id} didn't compile"
}
```


Runner
--------
Runs the previously compiled attempt and returns one of 3 JSONs to port 3000:

The return_type variable can take values from 0 to 2

0. for attempts, returns ```json { id: 1, case: '0', result: true }  ``` to the "attempts/judge_results" url

1. for problems, returns ```json { id: 1, case: '0', result: '2\n' } ``` to the "problems/judge_results" url

2. for toolkit,  returns ```json { id: 1, case: '0', result: '2\n' } ``` to the "toolkit/judge_results" url



Set up
---------

The directory where Deb compiles the programs into and runs them from can be changed by changing the "dir" variable of both.
This sistem is ment to run inside a virtual box on the same server as the SEPAP sistem. The virtual box is created using Vagrant and this base box:
https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box
You can add this box to the server under vagrant using
```sh vagrant box add deb https://s3-us-west-2.amazonaws.com/squishy.vagrant-boxes/precise64_squishy_2013-02-09.box ```
after the box has downloaded you can run vagrant ```sh init deb ``` then ```sh vagrant up ```
