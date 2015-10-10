module.exports = 
  resolve: 
    userValidated: ->
      global.copayApp.userValidated
    membershipsLoaded: ->
      global.copayApp.membershipsLoaded
  url: '/purchases/new'
  template: require('./create-purchase-page.html')
  controller: ($scope, Records, $location, Toast, CurrentUser, $window) ->
    console.log('create purchase controller loaded!')
    
    $scope.currentUser = CurrentUser()
    $scope.group = CurrentUser().groups()[0]
    $scope.selectedUsers = []

    Records.memberships.fetchByGroupId($scope.group.id)
    $scope.purchase = Records.purchases.build(groupId: $scope.group.id)

    $scope.cancel = () ->
      $window.history.back()

    $scope.userIsSelected = (user) ->
      _.find $scope.selectedUsers, (member) ->
        member.id == user.id

    $scope.selectBtnClassForUser = (user) ->
      if $scope.userIsSelected(user)
        "create-purchase-page__member-select-btn-selected"
      else
        "create-purchase-page__member-select-btn-unselected"

    $scope.toggleUserSelected = (user) ->
      if $scope.userIsSelected(user)
        _.remove $scope.selectedUsers, (selectedUser) ->
          selectedUser.id == user.id
      else
        $scope.selectedUsers.push(user)

    $scope.done = () ->
      if $scope.purchaseForm.$valid
        Records.purchases.saveWithRelevantUsers($scope.purchase, $scope.selectedUsers).then ->
          console.log('meow')
          $location.path("/groups/#{$scope.group.id}")
          Toast.show('You registered a purchase :3')
