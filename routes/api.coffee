module.exports = (app, db) ->
  api = {}

  api = require('../api/v1/campaigns')(api, db)

  app.get '/api/v1/campaigns', api.v1.getCampaigns
  app.get '/api/v1/campaigns/:id', api.v1.getCampaign
