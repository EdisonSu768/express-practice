routeMvc = require './routeMvc.coffee'
module.exports = (app) ->
  app.get '/', (req, res, next) ->
    routeMvc('index', 'index', req, res, next)
  app.get '/login', (req, res, next) ->
    routeMvc('index', 'login', req, res, next)
  app.post '/validateaccount.:format', (req, res, next) ->
    routeMvc('index', 'validateaccount', req, res, next)
  app.get '/gethelloworld', (req, res, next) ->
    routeMvc('index', 'getHelloWorld', req, res, next)



