
#TODO// need refine
http = require 'http'
app = require '../server'
server = http.createServer(app).listen(4000)


module.exports = server