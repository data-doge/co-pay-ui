null

### @ngInject ###
global.copayApp.factory 'UserModel', (BaseModel) ->
  class UserModel extends BaseModel
    @singular: 'user'
    @plural: 'users'

    relationships: ->
      @hasMany 'memberships', with: 'userId'

    groups: ->
      console.log('@memberships(): ', @memberships())
      groupIds = _.map @memberships(), (membership) ->
        membership.groupId
      @recordStore.groups.find(groupIds)