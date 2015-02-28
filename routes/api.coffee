module.exports = (app, api, db) ->
  app.get '/api/v1/campaigns', api.v1.getCampaigns
  app.get '/api/v1/campaigns/:id', api.v1.getCampaign
  app.get '/api/v1/candidates', api.v1.getCandidates
  app.get '/api/v1/candidates/:id', api.v1.getCandidate
  app.get '/api/v1/search', api.v1.search
  app.get '/api/v1/candidates/:id/campaigns', api.v1.findCampaignsByCandidateId
