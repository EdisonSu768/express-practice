module.exports =
  index: (req, res, next) ->
    res.render('index', {title: 'Express'})
  login: (req, res, next) ->
    res.render('login/login.jade')
  validateaccount: (req, res, next) ->
    if req.params.format is 'json'
      # To test the parameters in url
      console.log '======================', req.params, req.body
      if req.body.email is 'a' and req.body.password is 'b'
        res.redirect('/')
#        res.render('index', {title: 'Welcom Back'})
      else
        res.status(500).send('error')

  getHelloWorld: (req, res, next) ->
    res.status(200).send('Hello world')