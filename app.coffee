express = require('express')
path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
MongoClient = require('mongodb').MongoClient
requireFu = require('require-fu')

app = express()

# view engine setup
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

# uncomment after placing your favicon in /public
#app.use(favicon(__dirname + '/public/favicon.ico'))
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false
app.use cookieParser()
app.use require('node-compass')(mode: 'expanded')
app.use express.static(path.join(__dirname, 'public'))
app.set 'mongo url', "mongodb://127.0.0.1:27017/ethics-api?slaveOk=true"

# catch 404 and forward to error handler
# app.use (req, res, next) ->
#   err = new Error('Not Found')
#   err.status = 404
#   next err

# development error handler
# will print stacktrace
# if app.get('env') == 'development'
#   app.use (err, req, res, next) ->
#     res.status err.status || 500
#     res.render 'error',
#       message: err.message,
#       error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status(err.status || 500)
  res.render 'error',
    message: err.message,
    error: {}

mongoOptions =
  db:
    w: 1
  server:
    poolSize: 10
    auto_reconnect: true

MongoClient.connect app.get('mongo url'), mongoOptions, (err, db) ->
  # Load up API
  #requireFu(__dirname + '/api/v1')(app, db)

  # Load up routes
  api = {}
  requireFu(__dirname + '/api/v1')(api, db)
  requireFu(__dirname + '/routes')(app, api, db)

module.exports = app
