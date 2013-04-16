angular.module("Intranet.services", ["ngResource"]).
factory 'SessionService', ($resource) ->
  Session = $resource("/sessions/:id", {id: "@id"})

  current_user = {authorized: false}

  login = (session, response_handler) ->
    Session.save session, (response) ->
      if response.authorized
        current_user = response.content.user
      else
        current_user = {}

      current_user.authorized = response.authorized

      if angular.isFunction response_handler
        response_handler(response.authorized, current_user)

  authorized = ->
    current_user.authorized

  currentUser = ->
    current_user

  {
    login,
    authorized,
    currentUser
  }
