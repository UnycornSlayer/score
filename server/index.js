var axios = require('axios');
var mysql = require('mysql');  

var con = mysql.createConnection({  
  host: "localhost",  
  user: "root",  
  password: "",
  database: "score",
});  
con.connect(function(err) {  
  if (err) throw err;  
  console.log("Connected!");  
});  
var teams_ids = [
211,
216,
222,
224,
228,
240,
4716,
762,
810,
212,
214,
217,
223,
226,
227,
230,
234,
242
]

segunda_liga = [
213,
215,
218,
221,
225,
229,
231,
233,
235,
236,
238,
243,
244,
245,
4717,
4799,
4801,
15130,
]
for (let i = 0; i < segunda_liga.length; i++) {
const options = {
  method: 'GET',
  url: `https://v3.football.api-sports.io/players?team=${segunda_liga[i]}&season=2022`,
  headers: {
    'X-RapidAPI-Key': '3ed7c59324cca8633b641059fd319997',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
  }
};


axios(options)
.then(function (request) {


teams =[]

Object.entries(request.data.response).forEach(([key, value]) => {
 // if(value.team.code === null)value.team.code = value.team.name.substring(0,3).toUpperCase()
  teams.push([value.player.id, i + 19, value.player.firstname,value.player.lastname,value.player.birth.date,value.player.nationality, value.player.height, value.player.weight, value.player.photo])
  
  console.log('name: ' + value.player.name + ' birthdate: ' + value.player.birth.date + 'nacionality: ' + value.player.nationality + 'height: ' + value.player.height + 'weight: ' + value.player.weight);
  console.log(value.player.photo)
});
//teams[5][3] = 'BOA'
var sql = "INSERT INTO players(api_id, team_id, first_name, last_name, birth_date, nationality, height, weight, photo) VALUES ?";
var values = teams;
con.query(sql, [values], function(err) {
  if (err) throw err;
});

})
.catch(function (error) {
  console.log(teams)
  console.log(error);
});
}