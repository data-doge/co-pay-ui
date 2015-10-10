null

### @ngInject ###
global.copayApp.factory 'GroupModel', (BaseModel) ->
  class GroupModel extends BaseModel
    @singular: 'group'
    @plural: 'groups'
    @serializableAttributes: ['name', 'currencyCode']

    relationships: ->
      @hasMany 'memberships'
      @hasMany 'purchases', sortBy: 'createdAt', sortDesc: true

    members: ->
      _.map @memberships(), (membership) ->
        membership.user()

    membersExceptMe: (currentUser) ->
      _.select @members(), (member) ->
        member.id != currentUser.id

    membershipFor: (user) ->
      _.first _.filter @memberships(), (membership) ->
        membership.userId == user.id