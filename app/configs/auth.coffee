### @ngInject ###

global.copayApp.config ($authProvider, config) ->
  $authProvider.configure
    apiUrl: config.apiPrefix