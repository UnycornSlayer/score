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

app.get("/players/:clubId/:seasonId", async (req, res) => {
  var clubId = req.params.clubId;
  var seasonId = req.params.seasonId;
  var teamID = await getClubPlayersForDifferentSeason(clubId, seasonId);
  var sql = `SELECT * FROM players as p JOIN teams as t on p.team_id = t.id JOIN leagues as l on t.league_id = l.id JOIN seasons as s on l.season_id = s.id WHERE p.team_id =${teamID} and s.id=${seasonId}`;

  con.query(sql, [], (error, rows) => {
    if (error) {
      return console.error(error.message);
    }
    let result = Object.values(JSON.parse(JSON.stringify(rows)));
    res.send(result);
  });
});

app.get("/teams/:leagueId/:seasonId", (req, res) => {
  var leagueId = req.params.leagueId;
  var seasonId = req.params.seasonId;
  var sql = `SELECT t.id, t.name FROM teams as t JOIN leagues as l on t.league_id = l.id JOIN seasons as s on l.season_id = s.id WHERE l.id = ${leagueId} and s.id = ${seasonId} `;

  con.query(sql, [], (error, rows) => {
    if (error) {
      return console.error(error.message);
    }
    let result = Object.values(JSON.parse(JSON.stringify(rows)));
    res.send(result);
  });
});

app.post("/users/:clubId", (req, res) => {
  var clubId = req.params.clubId;
  const { firstName, lastName, height, weight, birthday, education, passport } =
    req.body;
  /* ------------------- PARA PC'S COM DATA NO FORMATO (dd/mm/yyyy) ---------------- */
  // var today = new Date();
  // var date = today.toLocaleDateString();
  // var dateArray = date.split("/");
  // var formattedDate =
  //   dateArray[0].padStart(2, "0") +
  //   "/" +
  //   dateArray[1].padStart(2, "0") +
  //   "/" +
  //   dateArray[2];
  /* --------------------- END OF COMMENT ------------------------------------------- */
  /* ---------------------PARA PC'S COM DATA NO FORMATO (mm/dd/yyyy) ------------------ */
  var today = new Date();
  var date = today.toLocaleDateString();
  var dateArray = date.split("/");
  var formattedDate =
    dateArray[1].padStart(2, "0") +
    "/" +
    dateArray[0].padStart(2, "0") +
    "/" +
    dateArray[2];
  /* --------------------- END OF COMMENT ------------------------------------------- */
  // Prepare the query
  const query = `INSERT INTO players(team_id, first_name, last_name, birth_date, height, weight,education, passport, antidopping_date, contract_date) VALUES (?,?,?,?,?,?,?,?,?,?)`;

  // Execute the prepared statement
  con.query(
    query,
    [
      clubId,
      firstName,
      lastName,
      birthday,
      height,
      weight,
      education,
      passport,
      formattedDate,
      formattedDate,
    ],
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

function getClubPlayersForDifferentSeason(clubId, seasonId) {
  return new Promise((resolve, reject) => {
    const query = `SELECT t.name FROM teams as t WHERE t.id =${clubId};`;
    con.query(query, (error, results) => {
      if (error) {
        reject(error);
      }
      const sql = `SELECT t.id FROM teams as t JOIN leagues as l on t.league_id = l.id JOIN seasons as s on l.season_id = s.id WHERE s.id = ${seasonId} AND t.name = '${results[0].name}'`;
      con.query(sql, (error, res) => {
        if (error) {
          reject(error);
        }
        resolve(res[0].id);
      });
    });
  });
}
