ObjectID = require('mongodb').ObjectID

module.exports = (api, db) ->
  api = api || {}
  api.v1 = api.v1 || {}

  api.v1.getReport = (req, res) ->
    db.collection("reports").findOne( {_id: new ObjectID(req.params.id)}, (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)
    )

  api.v1.getReports = (req, res) ->
    db.collection("reports").find().toArray (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)

  api.v1.findReportsByCampaignId = (req, res) ->
    db.collection("reports").find( {'campaignId': new ObjectID(req.params.id)} ).toArray (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)

  api
