null

### @ngInject ###
global.copayApp.factory 'PurchaseModel', (BaseModel) ->
  class GroupModel extends BaseModel
    @singular: 'purchase'
    @plural: 'purchases'
    @indices: ['groupId', 'userId']
    @serializableAttributes: ['description', 'details', 'amount', 'groupId', 'userId']

    relationships: ->
      @belongsTo 'group'
      @belongsTo 'user'