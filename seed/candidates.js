conn = new Mongo();
db = conn.getDB("ethics-api");

for(var i = 1; i <= 3; i ++) {
  var json = {
    nameId: i,
    lastName: 'Last Name ' + i,
    firstName: 'First Name ' + i,
    address: {
      street: 'Street ' + i,
      city: 'City ' + i,
      state: 'State ' + i,
      zip: 'Zip' + i
    },
    phoneNumber: 'Phone number' + i
  };

  db.candidates.insert(json);
}
