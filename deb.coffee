express = require("express")
http = require('http')
compiler = require('compiler')
runner = require('runner')

app = express()
app.use(express.bodyParser())
app.post('/', (request, response) ->
  console.log(request.body)
  compiler(request.body,runner)
  response.send(200))
app.listen(6666)
