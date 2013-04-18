@HomeController = ["$scope", "$resource", "$location", "SessionService", ($scope, $resource, $location, SessionService) ->
    if SessionService.authorized()
      current_user = SessionService.currentUser()
      console.dir current_user
      $scope.username = current_user.login_username
    else
      $location.path "/login"

]

