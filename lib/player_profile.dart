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

class PlayerProfile extends StatefulWidget {
  final int? playerId;

  const PlayerProfile({super.key, this.playerId});

  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  List<Map<String, dynamic>> playerInfo = [];
  int? _playerId;

  @override
  void initState() {
    _playerId = widget.playerId;
    _selectedIndex = 1;
    super.initState();
    getIsLogin().then((result) {
      setState(() {
        _isLogin = result;
      });
    });
    fetchPlayer(_playerId!).then((result) {
      setState(() {
        playerInfo = result;
      });
    });
  }

  // function to send GET request to API to get every player of this club
  Future<List<Map<String, dynamic>>> fetchPlayer(int playerId) async {
    var url = Uri.parse('http://localhost:3000/player/$playerId');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var players = json.decode(response.body)['results'];
      if (players is List) {
        return players
            .map((player) => {
                  "first_name": player["first_name"],
                  "last_name": player["last_name"],
                  "contract_date": player["contract_date"],
                  "birth_date": player["birth_date"],
                  "height": player["height"],
                  "weight": player["weight"],
                  "education": player["education"],
                  "antidopping_test": player["antidopping_date"],
                  "team_name": player["team_name"],
                  "passport": player["passport"]
                })
            .toList();
      } else {
        throw Exception('Failed to parse players from API response');
      }
    } else {
      throw Exception('Failed to load players from API');
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

  int daysSinceDate(String date) {
    cons.log(date, name: "Date");
    final dateParts = date.split("/");
    final day = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final year = int.parse(dateParts[2]);
    final givenDate = DateTime(year, month, day);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(givenDate);
    return difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder(
          future: fetchPlayer(_playerId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  '${snapshot.data![0]["first_name"]} ${snapshot.data![0]["last_name"]}');
            } else if (snapshot.hasError) {
              return const Text("Error");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      body: FutureBuilder<List>(
        future: fetchPlayer(_playerId!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? playerInfo = snapshot.data;
            return Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/default.png', height: 100, width: 100)
                  ],
                ),
              ),
              Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${playerInfo![0]["first_name"]}" == "null" ||
                                "${playerInfo[0]["first_name"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["first_name"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${playerInfo[0]["last_name"]}" == "null" ||
                                "${playerInfo[0]["last_name"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["last_name"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ]),
                const SizedBox(
                  height: 50,
                  width: 300,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${playerInfo[0]["height"]}" == "null" ||
                                "${playerInfo[0]["height"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["height"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${playerInfo[0]["weight"]}" == "null" ||
                                "${playerInfo[0]["weight"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["weight"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ]),
                const SizedBox(
                  height: 50,
                  width: 300,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Birth Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Crontact Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${playerInfo[0]["birth_date"]}" == "null" ||
                                "${playerInfo[0]["birth_date"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["birth_date"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${playerInfo[0]["contract_date"]}" == "null" ||
                                "${playerInfo[0]["contract_date"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["contract_date"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ]),
                const SizedBox(
                  height: 50,
                  width: 300,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Anti-Dopping test",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Level of Schooling",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${playerInfo[0]["antidopping_test"]}" == "null" ||
                                "${playerInfo[0]["antidopping_test"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["antidopping_test"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${playerInfo[0]["education"]}" == "null" ||
                                "${playerInfo[0]["education"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["education"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ]),
                const SizedBox(
                  height: 50,
                  width: 300,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Current Club",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Passport number",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${playerInfo[0]["team_name"]}" == "null" ||
                                "${playerInfo[0]["team_name"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["team_name"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${playerInfo[0]["passport"]}" == "null" ||
                                "${playerInfo[0]["passport"]}" == ""
                            ? "Untold"
                            : "${playerInfo[0]["passport"]}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ]),
                const SizedBox(
                  height: 50,
                  width: 300,
                ),
              ])
            ]);
          }
          return const CircularProgressIndicator();
        },
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
