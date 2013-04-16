@HomeController = ["$scope", "$resource", "$location", "SessionService", ($scope, $resource, $location, SessionService) ->

  initialize = ->
    if SessionService.authorized()
      current_user = SessionService.currentUser()
      $scope.username = current_user.login_username
    else
      $location.path "/login"

  initialize()
]

