(function() {
  var expressPracticeModule;

  expressPracticeModule = angular.module('expressPracticeModule', []);

  expressPracticeModule.service('loginService', [
    '$http', '$q', '$log', function($http, $q, $log) {
      var _login, _loginService;
      _login = function(_account) {
        var _loginDefer;
        _loginDefer = $q.defer();
        return $http.post('/login', _account).then(function(_success) {
          _loginDefer.resolve(_success.data);
          return $log('Validate successfully');
        }, function(_err) {
          return _loginDefer.reject('Error');
        });
      };
      return _loginService = {
        login: _login
      };
    }
  ]);

  expressPracticeModule.controller('loginController', [
    '$scope', 'loginService', function($scope, loginService) {
      console.log('aaaaaaaaaaaaaaaaaaaaaaaaaa', $scope.form);
      $scope.loginInfo = {
        email: '',
        password: ''
      };
      return $scope.login = function(_form) {
        console.log('$scope.loginInfo', _form, $scope.form);
        return loginService.login($scope.loginInfo);
      };
    }
  ]);

}).call(this);
