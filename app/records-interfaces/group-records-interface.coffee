null

### @ngInject ###
global.copayApp.factory 'GroupRecordsInterface', (config, BaseRecordsInterface, GroupModel) -> 
  class GroupRecordsInterface extends BaseRecordsInterface
    model: GroupModel
    constructor: (recordStore) ->
      @baseConstructor recordStore
      @remote.apiPrefix = config.apiPrefix 
