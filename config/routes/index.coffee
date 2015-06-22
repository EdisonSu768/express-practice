routeMvc = require './routeMvc.coffee'
module.exports = (app) ->
  app.get '/', (req, res, next) ->
    routeMvc('index', 'index', req, res, next)



