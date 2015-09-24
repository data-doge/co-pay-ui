module.exports = 
  url: '/groups/:groupId'
  template: require('./group-page.html')
  controller: ($scope, Records, $stateParams, $location, $window, ipCookie, AuthenticateUser, $auth, Toast) ->

    AuthenticateUser().then (currentUser) ->
      groupId = parseInt($stateParams.groupId)
      ipCookie('currentGroupId', groupId)
      $scope.currentUser = currentUser
      # Records.memberships.fetchMyMemberships().then (data) ->
      #   $scope.accessibleGroupsLoaded = true
      #   $scope.accessibleGroups = data.groups
      Records.groups.findOrFetchById(groupId).then (group) ->
        $scope.group = group
        Records.purchases.fetchByGroupId(groupId).then (data) ->
        # $scope.currentMembership = group.membershipFor(currentUser)

    $scope.selectTab = (tabNum) ->
      $scope.tabSelected = tabNum

    return