null

### @ngInject ###
global.copayApp.run ($rootScope, Records, $q, $location, $auth, Toast) ->

  console.log('boot.coffee has loaded')

  userValidatedDeferred = $q.defer()
  global.copayApp.userValidated = userValidatedDeferred.promise

  membershipsLoadedDeferred = $q.defer()
  global.copayApp.membershipsLoaded = membershipsLoadedDeferred.promise

  work = (user) ->
    global.copayApp.currentUserId = user.id
    userValidatedDeferred.resolve()
    Records.memberships.fetchMyMemberships().then (data) ->
      console.log('memberships loaded!')
      membershipsLoadedDeferred.resolve()

  $rootScope.$on 'auth:validation-success', (ev, user) ->
    console.log('validation success!')
    work(user)

  $rootScope.$on 'auth:login-success', (ev, user) ->
    console.log('login success!')
    work(user)

  $rootScope.$on 'auth:validation-error', () ->
    userValidatedDeferred.reject()
    membershipsLoadedDeferred.reject()
    global.copayApp.currentUserId = null
    console.log('validation-error')
    $location.path('/')
    Toast.show('Please log in to continue')
