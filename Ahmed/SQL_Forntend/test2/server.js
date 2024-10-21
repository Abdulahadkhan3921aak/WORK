const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');




const app = express();
const port = 3000;

// Set the views directory
app.set('views', __dirname);

app.set('view engine', 'ejs');

app.use(express.static('public'));

// Database connection details
const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "03152997800@redangle",
  database: "sakila"
});

pool.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/query', async (req, res) => {
  const query = req.body.query;
  pool.query(query, function (err, result) {
    if (err) {
      console.error(err);
      res.status(500).send('Error executing query');
      return;
    }
    res.render('results', { rows: result });
  });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
