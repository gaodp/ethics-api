module.exports = (app, api, db) ->
  app.get '/api/v1/campaigns', api.v1.getCampaigns
  app.get '/api/v1/campaigns/:id', api.v1.getCampaign
  app.get '/api/v1/candidates', api.v1.getCandidates
  app.get '/api/v1/candidates/:id', api.v1.getCandidate
  app.get '/api/v1/candidates/:id/campaigns', api.v1.findCampaignsByCandidateId
  app.get '/api/v1/campaigns/:id/reports', api.v1.findReportsByCampaignId
  app.get '/api/v1/reports', api.v1.getReports
  app.get '/api/v1/reports/:id', api.v1.getReport
