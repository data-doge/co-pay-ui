global.copayApp.filter 'timeFromNowInWords', ->
  (date) ->
    moment(date).fromNow(true)

global.copayApp.filter 'timeFromNowAmount', ->
  (date) ->
    moment(date).fromNow(true).split(' ')[0]

global.copayApp.filter 'timeFromNowUnits', ->
  (date) ->
    moment(date).fromNow(true).split(' ')[1]

global.copayApp.filter 'timeToNowAmount', ->
  (date) ->
    moment(date).toNow(true).split(' ')[0]

global.copayApp.filter 'timeToNowUnits', ->
  (date) ->
    moment(date).toNow(true).split(' ')[1]

global.copayApp.filter 'exactDateWithTime', ->
  (date) ->
    moment(date).format('dddd MMMM Do [at] h:mm a')
