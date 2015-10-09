module.exports = 
  resolve:
    userValidated: ->
      global.copayApp.userValidated
    membershipsLoaded: ->
      global.copayApp.membershipsLoaded    
  url: '/groups/:groupId'
  template: require('./group-page.html')
  controller: ($scope, Records, $stateParams, $location, $window, $auth, Toast, CurrentUser, $mdSidenav, UserCan) ->

    console.log('group page loaded')
    groupId = parseInt($stateParams.groupId)

    Records.groups.findOrFetchById(groupId)
      .then (group) ->
        if UserCan.viewGroup(group)
          console.log('user can view group')
          $scope.currentUser = CurrentUser()
          $scope.group = group
          Records.purchases.fetchByGroupId(group.id)
        else
          console.log('user can not view group')
      .catch ->
        console.log("group not found")


    $scope.selectTab = (tabNum) ->
      $scope.tabSelected = tabNum

    $scope.openSidenav = ->
      $mdSidenav('left').open()

    $scope.signOut = ->
      $auth.signOut().then ->
         Toast.show("You've been signed out")
         global.copayApp.currentUserId = null
         $location.path('/')

    return