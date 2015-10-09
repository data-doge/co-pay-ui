null

### @ngInject ###
global.copayApp.factory 'UserCan', (Toast, $location, $q, Records) ->
  new class UserCan

    viewGroup: (group) ->
      validMemberships = Records.memberships.find({
        groupId: group.id,
        memberId: global.copayApp.currentUserId
      })
      validMemberships.length == 1