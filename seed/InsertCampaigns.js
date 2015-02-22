conn = new Mongo();
db = conn.getDB("ethics-api");

for(var i = 1; i <= 3; i ++) {
  var json = {
    _id: i.toString(),
    candidate: {
      _id: i.toString(),
      lastName: "lastName_" + i,
      firstName: "firstName_" + i
    },
    office: "office_" + i,
    status: "active",
    reports: [{
      _id: i.toString(),
      type: "type_" + i,
      year: new Date().getFullYear(),
      title: "title_" + i,
      dateReceived: new Date()
    }]
  };

  db.campaigns.insert(json);
}