@SessionsController = ($scope, $resource) ->
  Session = $resource("/sessions/:id", {id: "@id"})

  $scope.createSession = ->
    Session.save $scope.session, (result) ->
      if result.authorized == 'true'
        $scope.result = "Byl jste přihlášen"
      else
        $scope.result = "Nesprávné uživatelské jméno nebo heslo"

