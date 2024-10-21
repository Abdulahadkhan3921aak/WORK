var mysql = require('mysql2');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "03152997800@redangle",
  database: "sakila"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});


con.query("SELECT * FROM actor LIMIT 10", function (err, result) {
  if (err) throw err;
  console.log(result);
});