module.exports = 
  url: '/groups/:groupId'
  template: require('./group-page.html')
  controller: ($scope, Records, $stateParams, $location, $window, ipCookie, AuthenticateUser, $auth, Toast) ->
    console.log('groups controller loaded!!')
    return