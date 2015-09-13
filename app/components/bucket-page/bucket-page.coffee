module.exports = 
  resolve: 
    membershipsLoaded: ->
      global.cobudgetApp.membershipsLoaded
  url: '/buckets/:bucketId'
  template: require('./bucket-page.html')
  controller: ($scope, Records, $stateParams, $location, CurrentUser, Toast) ->
    
    groupId = global.cobudgetApp.currentGroupId
    bucketId = parseInt $stateParams.bucketId

    Records.groups.findOrFetchById(groupId).then (group) ->
      $scope.group = group
      $scope.currentMembership = group.membershipFor(CurrentUser())

    Records.buckets.findOrFetchById(bucketId).then (bucket) ->
      $scope.bucket = bucket
      $scope.status = bucket.status
      Records.comments.fetchByBucketId(bucketId).then ->
        window.scrollTo(0, 0)

    $scope.back = ->
      Toast.hide()
      $location.path("/groups/#{groupId}")

    $scope.showFullDescription = false

    $scope.readMore = ->
      $scope.showFullDescription = true

    $scope.showLess = ->
      $scope.showFullDescription = false

    $scope.newComment = Records.comments.build(bucketId: bucketId)

    $scope.createComment = ->
      $scope.newComment.save()
      $scope.newComment = Records.comments.build(bucketId: bucketId)

    $scope.userCanStartFunding = ->
      $scope.currentMembership.isAdmin || $scope.bucket.author().id == $scope.currentMembership.member().id

    $scope.openForFunding = ->
      if $scope.bucket.target
        $scope.bucket.openForFunding().then ->
          $scope.back()
          Toast.showWithRedirect('You launched a bucket for funding', "/buckets/#{bucketId}")
      else
        alert('Estimated funding target must be specified before funding starts')        

    $scope.editBucket = ->
      $location.path("/buckets/#{bucketId}/edit")

    $scope.userCanEditBucket = ->
      $scope.bucket && $scope.userCanStartFunding()

    $scope.contribution = Records.contributions.build
      bucketId: bucketId

    $scope.openFundForm = ->
      $scope.fundFormOpened = true

    $scope.totalAmountFunded = ->
      parseFloat($scope.bucket.totalContributions) + ($scope.contribution.amount || 0)

    $scope.totalPercentFunded = ->
      $scope.totalAmountFunded() / parseFloat($scope.bucket.target) * 100

    $scope.maxAllowableContribution = ->
      _.min([$scope.bucket.amountRemaining(), $scope.currentMembership.balance()])

    $scope.normalizeContributionAmount = ->
      if $scope.contribution.amount > $scope.maxAllowableContribution()
        $scope.contribution.amount = $scope.maxAllowableContribution()

    $scope.updateProgressBarColor = (contributionAmount) ->
      if contributionAmount > 0
        jQuery('.bucket-page__progress-bar .md-bar').addClass('bucket-page__progress-bar-green')
      else
        jQuery('.bucket-page__progress-bar .md-bar').removeClass('bucket-page__progress-bar-green')

    $scope.$watch ((scope) ->
      scope.contribution.amount
    ), $scope.updateProgressBarColor

    $scope.submitContribution = ->
      $scope.contribution.save().then ->
        $scope.back()
        Toast.show('You funded a bucket')
        
    return