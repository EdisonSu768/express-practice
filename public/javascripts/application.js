(function() {
  var expressPracticeModule;

  expressPracticeModule = angular.module('expressPracticeModule', []);

  expressPracticeModule.service('loginService', [
    '$http', '$q', function($http, $q) {
      var _login, _loginService;
      _login = function(_account) {
        $http.post('/validateAccount.json', _account).then(function(_success) {
          console.log('validate successfully');
          return window.location.href = '/';
        }, function(_err) {
          return _loginDefer.reject('Error:', _err);
        });
        return _loginDefer.promise;
      };
      return _loginService = {
        login: _login
      };
    }
  ]);

  expressPracticeModule.controller('loginController', [
    '$scope', 'loginService', function($scope, loginService) {
      return $scope.login = function() {
        var _account;
        _account = {
          email: $scope.form.email.$viewValue,
          password: $scope.form.password.$viewValue
        };
        console.log(_account);
        return loginService.login(_account).then(function() {
          return console.log('Success');
        }, function(_err) {
          return console.log('Error', _err);
        });
      };
    }
  ]);

}).call(this);
