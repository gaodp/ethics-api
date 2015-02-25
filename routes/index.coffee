module.exports = (app, db) ->
  app.get "/", (req, res) ->
    res.send 'index'
