// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer' as cons;

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:score/leagues_page.dart';
import 'package:score/login_page.dart';
import 'package:score/player_profile.dart';

class Contracts extends StatefulWidget {
  const Contracts({super.key});

  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  List<Map<String, dynamic>> playersList = [];
  String? _currentClub;

  @override
  void initState() {
    super.initState();
    getIsLogin().then((result) {
      setState(() {
        _isLogin = result;
      });
    });
    fetchPlayers().then((result) {
      setState(() {
        playersList = result;
      });
    });
  }

  // function to send GET request to API to get every player of this club
  Future<List<Map<String, dynamic>>> fetchPlayers() async {
    // var url = Uri.parse('http://192.168.1.231:3000/contracts');
    var url = Uri.parse('http://localhost:3000/contracts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var players = json.decode(response.body)["results"];
      for (var i = 0; i < players.length; i++) {
        playersList.add({
          "id": players[i]["id"].toString(),
          "first_name": players[i]["first_name"].toString(),
          "last_name": players[i]["last_name"].toString(),
          "contract_date": players[i]["contract_date"].toString(),
          "photo": players[i]["photo"].toString(),
          "team_name": players[i]["name"].toString(),
          "team_logo": players[i]["logo"].toString()
        });
      }
      return playersList;
    } else {
      throw Exception('Failed to load players');
    }
  }

  // function to get Session Variable isLogin
  Future<bool> getIsLogin() async {
    return await FlutterSession().get("isLogin");
  }

  bool _isLogin = false;

  int _selectedIndex = 1;

// function to handle NavBar clicks
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // First element on Navbar
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LeaguesPage(),
          ),
        );
        break;
      case 1: // Second element on Navbar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Contracts(),
          ),
        );
        break;
      case 2: // Third element on Navbar
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage(),
          ),
          (route) => false,
        );
        break;
    }
  }

  int daysFromToday(String date) {
    var dateFormat = DateFormat("dd/MM/yyyy");
    var parsedDate = dateFormat.parse(date);
    var twoYearsLater = parsedDate.add(const Duration(days: 730));

    var difference = twoYearsLater.difference(DateTime.now()).inDays;

    return difference >= 0 ? difference : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Expiring Contracts"),
        actions: <Widget>[
          _isLogin
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () {
                      // Add player modal
                    },
                  ),
                )
              : Container(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                var currentTeamName = playersList[index]["team_name"];
                var previousTeamName =
                    index > 0 ? playersList[index - 1]["team_name"] : "";

                if (currentTeamName != previousTeamName) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Image.asset("assets/default-team.png",
                                height: 50, width: 50),
                            // ignore: prefer_const_constructors
                            SizedBox(width: 16),
                            Text(currentTeamName,
                                style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerProfile(
                                playerId: int.parse(playersList[index]["id"]),
                              ),
                            ),
                          )
                        },
                        leading: Image.asset('assets/default.png',
                            height: 100, width: 100),
                        title: Text(
                            "${playersList[index]["first_name"]} ${playersList[index]["last_name"]}"),
                        subtitle: Text(
                            "Contracted at: ${playersList[index]["contract_date"]} (${daysFromToday(playersList[index]["contract_date"]).toString()} days)"),
                      ),
                    ],
                  );
                } else {
                  return ListTile(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayerProfile(
                            playerId: int.parse(playersList[index]["id"]),
                          ),
                        ),
                      )
                    },
                    leading: Image.asset('assets/default.png',
                        height: 100, width: 100),
                    title: Text(
                        "${playersList[index]["first_name"]} ${playersList[index]["last_name"]}"),
                    subtitle: Text(
                        "Contracted at: ${playersList[index]["contract_date"]} (${daysFromToday(playersList[index]["contract_date"]).toString()} days)"),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "Leagues",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_go),
            label: "Contracts",
          ),
          BottomNavigationBarItem(
            icon: Icon(_isLogin ? Icons.logout : Icons.person),
            label: _isLogin ? "Logout" : "Login",
          ),
        ],
      ),
    );
  }
}
