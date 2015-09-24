Loki = require('lokijs')

app = global.copayApp

AngularRecordStore = require('angular_record_store')

app.factory('BaseModel', AngularRecordStore.BaseModelFn)
app.factory('BaseRecordsInterface', ['RestfulClient', '$q', AngularRecordStore.BaseRecordsInterfaceFn])
app.factory('RecordStore', AngularRecordStore.RecordStoreFn)
# $compile is a joke, actually $upload (current version used is 3.x, need to update, might not even need to use)
app.factory('RestfulClient', ['$http', '$compile', AngularRecordStore.RestfulClientFn])

app.factory 'Records', (RecordStore, GroupRecordsInterface, UserRecordsInterface, MembershipRecordsInterface) ->
  db = new Loki('copayApp')
  recordStore = new RecordStore(db)
  recordStore.addRecordsInterface(GroupRecordsInterface)
  recordStore.addRecordsInterface(UserRecordsInterface)
  recordStore.addRecordsInterface(MembershipRecordsInterface)
  recordStore