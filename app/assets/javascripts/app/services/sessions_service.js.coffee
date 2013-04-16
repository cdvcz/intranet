angular.module("Intranet.services", ["ngResource"]).
factory 'SessionService', ($resource) ->
  Session = $resource("/sessions/:id", {id: "@id"})

  current_user = {authorized: false}

  login = (session, result_handler) ->
    Session.save session, (result) ->
      if result.authorized
        current_user = result.content.user
      else
        current_user = {}

      current_user.authorized = result.authorized

      if angular.isFunction result_handler
        result_handler(result.authorized, current_user)

  authorized = ->
    current_user.authorized

  currentUser = ->
    current_user

  {
    login,
    authorized,
    currentUser
  }
