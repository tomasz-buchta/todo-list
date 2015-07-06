todoerServices = angular.module('alertService',['angular-flash.service','angular-flash.flash-alert-directive'])

todoerServices.service('Alert',['flash','$timeout',(flash,$timeout)->
  {
    success: (message)->
      flash.success = message
      $timeout(->
        flash.success = ''
      ,
      3000)

    error:   (message)->
      flash.error = message
      $timeout(->
        flash.error = ''
      ,
      5000)
    info:   (message)->
      flash.info = message
      $timeout(->
        flash.info = ''
      ,
      3000)
  }
])