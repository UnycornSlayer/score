const express = require("express");
const cors = require("cors");
var mysql = require("mysql");
const bodyParser = require("body-parser");
const request = require("request");

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

app.get("/images/:imageUrl", (req, res) => {
  var imageUrl = req.params.imageUrl;

  request({ url: imageUrl, encoding: null }, (error, response, body) => {
    if (error) {
      return console.error(error.message);
    }
    res.set("Content-Type", response.headers["content-type"]);
    res.send(body);
  });
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
  var sql = `SELECT p.id, p.first_name,p.last_name,p.contract_date,p.photo FROM players as p JOIN teams as t on p.team_id = t.id JOIN leagues as l on t.league_id = l.id JOIN seasons as s on l.season_id = s.id WHERE p.team_id =${teamID} and s.id=${seasonId}`;

  con.query(sql, [], (error, rows) => {
    if (error) {
      return console.error(error.message);
    }
    let result = Object.values(JSON.parse(JSON.stringify(rows)));
    result.forEach((p) => {
      p.photo = `/images/${p.photo}`;
    });
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

app.delete("/delete-player/:Id", (req, res) => {
  var id = req.params.Id;
  var sql = `DELETE FROM players WHERE id =${id}`;

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

app.get("/player/:playerId", (req, res) => {
  var playerId = req.params.playerId;
  // Prepare the query
  const query = `SELECT first_name,last_name,birth_date,height,weight,education,passport,antidopping_date,contract_date, teams.name as 'team_name' FROM players JOIN teams on players.team_id = teams.id WHERE players.id = ${playerId}`;

  // Execute the prepared statement
  con.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error });
    }
    return res.json({ results });
  });
});

app.get("/contracts", (req, res) => {
  // Prepare the query
  const query = `SELECT p.id,p.first_name,p.last_name,p.contract_date,p.photo,t.name,t.logo
  FROM players as p JOIN teams as t on p.team_id = t.id
  WHERE STR_TO_DATE(contract_date, '%d/%m/%Y') + INTERVAL 2 YEAR <= DATE_ADD(NOW(), INTERVAL 180 DAY)
  ORDER BY t.name, STR_TO_DATE(contract_date, '%d/%m/%Y') ASC;`;

  // Execute the prepared statement
  con.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error });
    }
    return res.json({ results });
  });
});

app.get("/antidopping/:days/:clubId", (req, res) => {
  let days = req.params.days;
  let clubId = req.params.clubId;
  // Prepare the query
  const query = `SELECT p.id,p.first_name,p.last_name,p.antidopping_date,p.photo,t.name,t.logo
  FROM players as p 
  JOIN teams as t on p.team_id = t.id
  WHERE DATEDIFF(NOW(), STR_TO_DATE(p.antidopping_date, '%d/%m/%Y')) <= ${days}
  AND t.id = ${clubId}
  ORDER BY STR_TO_DATE(antidopping_date, '%d/%m/%Y') DESC`;

  // Execute the prepared statement
  con.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error });
    }
    return res.json({ results });
  });
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
        console.log("ID to resolve: " + res[0].id);
        resolve(res[0].id);
      });
    });
  });
}

app.listen(3000, () => {
  console.log("Example app listening on port 3000!");
});
