index = require '../../app/controllers/index_controller.coffee'
module.exports = (app) ->
  app.get '/', index.index
  app.get '/login', index.login
  app.post '/validateaccount.:format', index.validateaccount
  app.get '/gethelloworld', index.getHelloWorld




