// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer' as cons;

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:score/leagues_page.dart';
import 'package:score/login_page.dart';

import 'players_page.dart';

class Classification extends StatefulWidget {
  const Classification({super.key});

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  // function to send POST request to API with form params
  List<String> seasonsList = [];
  List<String> teamsList = [];
  String dropdownvalue = 'All';

  @override
  void initState() {
    _selectedIndex = 1;
    super.initState();
    getIsLogin().then((result) {
      setState(() {
        _isLogin = result;
      });
    });
    fetchSeasons().then((result) {
      setState(() {
        seasonsList = result;
        dropdownvalue = seasonsList[0];
      });
    });

    fetchClubs(1).then((result) {
      setState(() {
        teamsList = result;
      });
    });
  }

  // function to send GET request to API to get every Season
  Future<List<String>> fetchSeasons() async {
    // var url = Uri.parse('http://192.168.1.231:3000/seasons');
    var url = Uri.parse('http://localhost:3000/seasons');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var seasons = json.decode(response.body);
      for (var i = 0; i < seasons.length; i++) {
        seasonsList.add(seasons[i]['name'].toString());
      }
      return seasonsList;
    } else {
      throw Exception('Failed to load seasons');
    }
  }

  // function to send GET request to API to get every player of this club
  Future<List<String>> fetchClubs(clubId) async {
    // var url = Uri.parse('http://192.168.1.231:3000/seasons');
    var url = Uri.parse('http://localhost:3000/teams/1/1');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var teams = json.decode(response.body);
      for (var i = 0; i < teams.length; i++) {
        teamsList.add(teams[i]["name"].toString());
      }
      return teamsList;
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
            builder: (context) => const PlayersPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Classification"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TODO: See what is going on with the Click event to be able to send seasonId to API Call
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items

                  items: seasonsList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 70,
                      child: Text("       #"),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text("Team Name"),
                    ),
                    SizedBox(
                      child: Text("Points"),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: teamsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text("      #$index."),
                          ),
                          Expanded(
                            child: ListTile(
                              onTap: () {
                                // TODO: Handle team click
                              },
                              title: Text("${teamsList[index]}"),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text("${51 - (index * 3)}"),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Players",
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
