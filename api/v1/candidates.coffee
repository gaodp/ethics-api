ObjectID = require('mongodb').ObjectID

module.exports = (api, db) ->
  api = api || {}
  api.v1 = api.v1 || {}

  api.v1.getCandidate = (req, res) ->
    db.collection("candidates").findOne( {_id: new ObjectID(req.params.id)}, (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)
    )

  api.v1.getCandidates = (req, res) ->
    findCriteria = req.query || {}
    if findCriteria.nameId
      findCriteria.nameId = parseInt(findCriteria.nameId) || findCriteria.nameId
    db.collection("candidates").find(findCriteria).toArray (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)

  api.v1.findCampaignsByCandidateId = (req, res) ->
    db.collection("campaigns").find( {'candidate._id': new ObjectID(req.params.id)} ).toArray (err, results) ->
      if err
        res.jsonp
          error: err
        , 500

        return

      res.jsonp(results)

  api
