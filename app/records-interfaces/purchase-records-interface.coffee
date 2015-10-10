null

### @ngInject ###
global.copayApp.factory 'PurchaseRecordsInterface', (config, BaseRecordsInterface, PurchaseModel) -> 
  class PurchaseRecordsInterface extends BaseRecordsInterface
    model: PurchaseModel
    constructor: (recordStore) ->
      @baseConstructor recordStore
      @remote.apiPrefix = config.apiPrefix 

    fetchByGroupId: (groupId) ->
      @fetch
        params:
          group_id: groupId

    saveWithRelevantUsers: (purchase, users) ->
      userIds = _.map users, (user) ->
        user.id
      @remote.create 
        purchase: 
          description: purchase.description
          details: purchase.details
          amount: purchase.amount
          group_id: purchase.groupId
        user_ids: userIds