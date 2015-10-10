null

### @ngInject ###
global.copayApp.factory 'UserCan', (Toast, $location, $q, Records) ->
  new class UserCan

    viewGroup: (group) ->
      validMemberships = Records.memberships.find({
        groupId: group.id,
        userId: global.copayApp.currentUserId
      })
      validMemberships.length == 1