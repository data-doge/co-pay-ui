module.exports = 
  url: '/'
  template: require('./welcome-page.html')
  controller: ($scope, $auth, $location, Records, $rootScope, ipCookie) ->

    $scope.login = (formData) ->
      $scope.formError = ""
      $auth.submitLogin
        email: formData.email
        password: formData.password

    # $scope.redirectToGroupPage = (user) ->
    #   ipCookie('currentUserId', user.id)
    #   if ipCookie('initialRequestPath') == undefined || ipCookie('initialRequestPath') == '/'
    #     Records.memberships.fetchMyMemberships().then (data) ->
    #       ipCookie('currentGroupId', data.groups[0].id)
    #       $location.path("/groups/#{ipCookie('currentGroupId')}")
    #   else
    #     $location.path(ipCookie('initialRequestPath'))

    $scope.$on 'auth:validation-success', (event, user) ->
      alert('validation success')
      # $scope.redirectToGroupPage(user) 

    $scope.$on 'auth:login-success', (event, user) ->
      alert('login success')
      # $scope.redirectToGroupPage(user)

    $scope.$on 'auth:login-error', (event, user) ->
      alert('login error')

    $scope.$on 'auth:login-error', () ->
      $scope.formError = "Invalid Credentials"

    return