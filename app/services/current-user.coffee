null

### @ngInject ###
global.copayApp.factory 'CurrentUser', (Records) ->
  ->
    Records.users.find(global.copayApp.currentUserId)