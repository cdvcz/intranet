services = angular.module("Intranet.services", ["ngResource"])

services.factory 'SessionService', ($resource) ->
  Session = $resource("/sessions/:id", {id: "@id"})

  current_user = {authorized: false}
  if sessionStorage.current_user
    current_user = sessionStorage.current_user

  login = (session, response_handler) ->
    Session.save session, (response) ->
      if response.authorized
        current_user = response.content.user
        sessionStorage.current_user = current_user
      else
        current_user = {}
        sessionStorage.clear()

      current_user.authorized = response.authorized

      if angular.isFunction response_handler
        response_handler(response.authorized, current_user)

  logout = ->
    Session.delete id: current_user.id

  authorized = ->
    current_user.authorized

  currentUser = ->
    current_user

  {
    login,
    logout,
    authorized,
    currentUser
  }
