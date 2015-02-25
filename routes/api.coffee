module.exports = (app, api, db) ->
  app.get '/api/v1/campaigns', api.v1.getCampaigns
  app.get '/api/v1/campaigns/:id', api.v1.getCampaign
