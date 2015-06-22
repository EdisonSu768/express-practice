path = require 'path'
# render the page based on controller name, method and id
routeMvc = (controllerName, actionName, req, res, next) ->
#  controllerPath =  path.resolve __dirname, '../../app/controllers/'
  controllerName = 'index' if not controllerName?
  controller = null
  try
    controller = require '../../app/controllers/' + controllerName + '_controller.coffee'
  catch e
    console.warn "controller not found: " + controllerName, e
    next()
    return
  data = null
  if typeof controller[actionName] is 'function'
    actionMethod = controller[actionName].bind controller
    actionMethod req, res, next
  else
    console.warn 'method not found: ' + actionName
    next()

module.exports = routeMvc