module.exports =
  index: (req, res, next) ->
    res.render('index', {title: 'Express'})
  login: (req, res, next) ->
    res.status(200).send('Hello word')
  a: () ->
