# ## Module
# ___expressPracticeModule___
#
# It is the application page

expressPracticeModule = angular.module 'expressPracticeModule', []

# #### service
# __longin_
#
# * It is used to provide http request.
expressPracticeModule.service 'loginService', ['$http', '$q', '$log', \
  ($http, $q, $log) ->
    # ## service function
    #  __login_
    #
    # * It is used to handle get requrest.
    _login = (_account) ->
      _loginDefer = $q.defer()
      $http.post('/login', _account).then (_success) ->
        _loginDefer.resolve _success.data
        $log 'Validate successfully'
      , (_err) ->
        _loginDefer.reject 'Error'

    _loginService =
      login: _login

]

expressPracticeModule.controller 'loginController', ['$scope','loginService', \
  ($scope, loginService) ->

    $scope.login =  ->
      _account =
        email: $scope.form.login.email.$viewValue
        password: $scope.form.login.password.$viewValue
      loginService.login(_account).then (_success) ->
        console.log (_success)
      , (_err) ->
        console.log 'Error', _err


]