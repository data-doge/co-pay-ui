null

### @ngInject ###
global.copayApp.factory 'MembershipModel', (BaseModel) ->
  class MembershipModel extends BaseModel
    @singular: 'membership'
    @plural: 'memberships'
    @indices: ['groupId', 'userId']

    relationships: ->
      @belongsTo 'user'
      @belongsTo 'group'