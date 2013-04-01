Deb
====
Judge, jury and executioner of the SEPAP sistem
------------------------------------------------


This sistem is written in Nodejs, it listens for requests on port 8000 and responds to port 3000 of localhost

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
{ "attempt_id":i,
  "attempt_ext":"c",
  "compare":true,
  "command": "gcc -x c -o %s %s.c",
  "source":"\"#include<stdio.h>\\n\\nint main()\\n{\\n char string [256];\\n gets (string);\\n printf(\\\"%s\\\\n\\\",string);\\n return 0;\\n}\\n\"",
  "cases":{ "0":{ "input":"#{0+i}\n", "output" : "3\n"},
            "1":{ "input":"#{1+i}\n", "output" : "#{1+i}\n"},
            "2":{ "input":"#{2+i}\n", "output" : "#{2+i}\n"}
          }
}
```

Compiler
---------
Writes the JSON"s source to a file named after the JSON"s attempt_id, compiles it and calls the runner module in it"s callback.
If Compiler couldn"t compile the attempt it returns a request to port 3000 with the following JSON:

```json
{ attempt_id:json.attempt_id,
  "eror":error,
  "message":"#{json.attempt_id} didn"t compile"
}
```

Runner
--------
Runs the previously compiled attempt and returns one of 3 JSONs to port 3000:

1. if there was a problem while runing it returns:
```json
{ "stderr":stderr,
  "eror":error
}
```
2. if JSON"s compare is equal to true:
```json
{ "id":id,
  "case":key,
  "result":result
}
```
3. if JSON"s compare is equal to false:
```json
{ "id":id,
  "case":key,
  "result":stdout
}
```

Set up
---------

The directory where Deb compiles the programs into and runs them from can be changed by changing the "dir" variable of both.
