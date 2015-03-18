conn = new Mongo();
db = conn.getDB("ethics-api");

for(var i = 1; i <= 3; i ++) {
  var json = {
    campaignId: new ObjectId(),
    candidate: {
      _id: new ObjectId(),
      lastName: 'lastName_' + i,
      firstName: 'firstName_' + i
    },
    type: 'Original',
    year: new Date().getFullYear(),
    title: 'Report ' + i,
    receivedDate: new Date(),
    contributions: [{
      contributorName: 'Contributor 1',
      contributorAddress: {
        street: 'Street ' + i,
        city: 'City ' + i,
        state: 'State ' + i,
        zip: 'Zip' + i
      },
      affiliation: 'Affiliation',
      receivedDate: new Date(),
      contributionType: 'Type ' + i,
      electionName: 'Election ' + i,
      inKindDescription: 'Description ' + i,
      inKindAmount: 0.00,
      cashAmount: 3500.00
    }, {
      contributorName: 'Contributor 2',
      contributorAddress: {
        street: 'Street ' + i,
        city: 'City ' + i,
        state: 'State ' + i,
        zip: 'Zip' + i
      },
      affiliation: 'Affiliation',
      receivedDate: new Date(),
      contributionType: 'Type ' + i,
      electionName: 'Election ' + i,
      inKindDescription: 'Description ' + i,
      inKindAmount: 0.00,
      cashAmount: 5000.00
    }]
  };

  db.reports.insert(json);
}
