global.jQuery = require('jquery')
global._ = require('lodash')
global.moment = require('moment')
global.camelize = require('camelize')

require('angular')
require('angular-ui-router')
require('angular-sanitize/angular-sanitize')
require('angular-cookie')
require('ng-token-auth')
require('angular-aria')
require('angular-animate')
require('angular-material')
require('angular-messages')
require('ng-focus-if')
require('angular-upload')
require('angular-material-icons')
require('angular-truncate-2')

if (process.env.NODE_ENV != 'production') {
  global.localStorage.debug = "*"
}

/* @ngInject */
global.copayApp = angular.module('copay', [
  'ui.router',
  'ng-token-auth',
  'ngMaterial',
  'ngMessages',
  'ipCookie',
  'focus-if',
  'lr.upload',
  'ngMdIcons',
  'truncate'
])
.constant('config', require('app/configs/app'))

require('app/configs/auth.coffee')

require('app/routes.coffee')
require('app/angular-record-store.coffee')

var concatenify = require('concatenify')
concatenify('./controllers/*.{js,coffee}')
concatenify('./records-interfaces/*.{js,coffee}')
concatenify('./models/*.{js,coffee}')
concatenify('./filters/*.{js,coffee}')
concatenify('./services/*.{js,coffee}')