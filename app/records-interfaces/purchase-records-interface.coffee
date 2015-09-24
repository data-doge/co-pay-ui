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