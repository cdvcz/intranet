@SessionsController = ["$scope", "$resource", "SessionService", ($scope, $resource, SessionService) ->

  $scope.user = SessionService.currentUser()

  $scope.createSession = ->
    SessionService.login $scope.session, (authorized, user) ->
      if authorized
        $scope.result = "Byl jste přihlášen jako #{user.login_username}"
        $scope.username = SessionService.currentUser().login_username
      else
        $scope.result = "Nesprávné uživatelské jméno nebo heslo"

  init = ->
    if SessionService.authorized()
      current_user = SessionService.currentUser()
      $scope.username = current_user.login_username
    else
      $scope.username = "odhlasen"

  init()
]
