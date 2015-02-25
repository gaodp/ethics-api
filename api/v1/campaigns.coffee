ObjectID = require('mongodb').ObjectID

module.exports = (api, db) ->
  api = api || {}
  api.v1 = api.v1 || {}

  api.v1.getCampaign = (req, res) ->
    db.collection("campaigns").findOne( {_id : new ObjectID(req.params.id)}, (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)
    )

  api.v1.getCampaigns = (req, res) ->
    db.collection("campaigns").find().toArray (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)

  api
