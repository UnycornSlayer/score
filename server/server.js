const express = require("express");
const cors = require("cors");
var mysql = require("mysql");
const bodyParser = require("body-parser");

const app = express();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "score",
});

app.use(cors());
app.use(bodyParser.json());

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

app.get("/seasons", (req, res) => {
  var sql = "SELECT * FROM seasons";

  con.query(sql, (error, rows, fields) => {
    if (error) {
      return console.error(error.message);
    }
    let result = Object.values(JSON.parse(JSON.stringify(rows)));
    res.send(result);
  });
});

app.post("/users", (req, res) => {
  const { firstName, lastName, height, weight, birthday, education, passport } =
    req.body;

  // Prepare the query
  const query = `INSERT INTO users (firstName, lastName, height, weight, birthDate, education, passport)
                  VALUES (?, ?, ?, ?, ?, ?, ?)`;

  // Execute the prepared statement
  con.query(
    query,
    [firstName, lastName, height, weight, birthday, education, passport],
    (error, results) => {
      if (error) {
        return res.status(500).json({ error });
      }
      return res.json({ results });
    }
  );
});

app.listen(3000, () => {
  console.log("Example app listening on port 3000!");
});
