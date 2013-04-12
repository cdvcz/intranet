@SessionsController = ($scope, $resource) ->
  Session = $resource("/sessions/:id", {id: "@id"})

  $scope.createSession = ->
    Session.save $scope.session, (result) ->
      if result.authorized == 'true'
        alert("ANO: " + result.content.user.last_name)
      else
        alert("NE!")

