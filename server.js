var express = require('express');
var path = require('path');
// connect-assets
var connectAssets = require('connect-assets');
//coffee-script register
var coffeeScript = require('coffee-script');
coffeeScript.register();
//var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'app/views'));
app.set('view engine', 'jade');


//middleware
var middleware = require('./config/middleware');
middleware(app);


//config app routes;
var routes = require('./config/routes');
routes(app);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  console.log('Server is running...');
  console.log('Node env is development');
  app.use(connectAssets());
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
if (app.get('env') === 'production') {
  console.log('Server is running...');
  console.log('Node env is production');
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: {}
    });
  });
}


module.exports = app;
