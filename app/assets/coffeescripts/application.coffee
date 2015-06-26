# ## Module
# ___expressPracticeModule___
#
# It is the application page
expressPracticeModule = angular.module 'expressPracticeModule', []

# #### service
# __longin_
#
# * It is used to provide http request.
expressPracticeModule.service 'loginService', ['$http', '$q', \
  ($http, $q) ->

    # ## service function
    #  __login_
    #
    # * It is used to handle get requrest.
    _login = (_account) ->
      _loginDefer = $q.defer()
      $http.post('/validateAccount.json', _account).then (_success) ->
        console.log 'validate successfully'
        window.location.href = '/'
      , (_err) ->
        _loginDefer.reject 'Error:', _err
      _loginDefer.promise

    _loginService =
      login: _login

    return _loginService

]

expressPracticeModule.controller 'loginController', ['$scope','loginService', \
  ($scope, loginService) ->

    $scope.login =  ->
      _account =
        email: $scope.form.email.$viewValue
        password: $scope.form.password.$viewValue
      console.log _account
      loginService.login(_account).then () ->
        console.log 'Success'
      , (_err) ->
        console.log 'Error', _err


]