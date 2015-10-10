null

### @ngInject ###
global.copayApp.factory 'PaymentModel', (BaseModel) ->
  class PaymentModel extends BaseModel
    @singular: 'payment'
    @plural: 'payments'
    @indices: ['purchaseId', 'userId']

    relationships: ->
      @belongsTo 'purchase'
      @belongsTo 'user'