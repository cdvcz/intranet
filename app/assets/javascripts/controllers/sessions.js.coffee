@SessionsController = ["$scope", "$location", "$resource", "SessionService", ($scope, $location, $resource, SessionService) ->

  $scope.user = SessionService.currentUser()

  $scope.createSession = ->
    SessionService.login $scope.session, (authorized, user) ->
      if authorized
        $scope.result = "Byl jste přihlášen jako #{user.login_username}"
        $location.path "/"
      else
        $scope.result = "Nesprávné uživatelské jméno nebo heslo"

  $scope.logout = ->
    SessionService.logout()
    $location.path "/login"

  init = ->
    if SessionService.authorized()
      current_user = SessionService.currentUser()
      $scope.username = current_user.login_username
    else
      $scope.username = "odhlasen"

  init()
]

