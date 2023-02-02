const express = require("express");
const cors = require("cors");
var mysql = require("mysql");

const app = express();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "score",
});

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "http://localhost:57957/");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

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

app.listen(3000, () => {
  console.log("Example app listening on port 3000!");
});
