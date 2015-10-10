null

### @ngInject ###
global.copayApp.factory 'PaymentRecordsInterface', (config, BaseRecordsInterface, PaymentModel) -> 
  class PaymentRecordsInterface extends BaseRecordsInterface
    model: PaymentModel
    constructor: (recordStore) ->
      @baseConstructor recordStore
      @remote.apiPrefix = config.apiPrefix

    fetchByPurchaseId: (purchaseId) ->
      @fetch
        params:
          purchase_id: purchaseId
