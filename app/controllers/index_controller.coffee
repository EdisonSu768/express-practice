module.exports =
  index: (req, res, next) ->
    res.render('index', {title: 'Express'})
  login: (req, res, next) ->
    res.render('login/login.jade')
  a: () ->
