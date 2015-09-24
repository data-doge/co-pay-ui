null

### @ngInject ###
global.copayApp.factory 'CurrentUser', (Records, ipCookie) ->
  ->
    Records.users.find(ipCookie('currentUserId'))