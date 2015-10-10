module.exports = 
  url: '/'
  template: require('./welcome-page.html')
  controller: ($scope, $auth, $location, Records, $rootScope) ->

    $scope.login = (formData) ->
      $scope.formError = ""
      $auth.submitLogin
        email: formData.email
        password: formData.password

    $scope.redirectToGroupPage = (user) ->
      Records.memberships.fetchMyMemberships().then (data) ->
        groupId = data.groups[0].id
        $location.path("/groups/#{groupId}")

    $scope.$on 'auth:validation-success', (event, user) ->
      $scope.redirectToGroupPage(user) 

    $scope.$on 'auth:login-success', (event, user) ->
      $scope.redirectToGroupPage(user)

    $scope.$on 'auth:login-error', () ->
      global.copayApp.currentUserId = null
      $scope.formError = "Invalid Credentials"

    return