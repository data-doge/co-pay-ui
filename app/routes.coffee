### @ngInject ###

global.copayApp.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $stateProvider
    .state 'group', require('app/components/group-page/group-page.coffee')
    .state 'welcome', require('app/components/welcome-page/welcome-page.coffee')
