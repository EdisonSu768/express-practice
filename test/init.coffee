
#TODO// need refine
http = require 'http'
app = require '../server'
global.getServer = http.createServer(app).listen(4000)


module.exports = getServer