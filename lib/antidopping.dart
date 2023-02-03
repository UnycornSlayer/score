// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer' as cons;

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:score/contracts.dart';
import 'package:score/leagues_page.dart';
import 'package:score/login_page.dart';
import 'package:score/player_profile.dart';

class Antidopping extends StatefulWidget {
  final int? clubId;
  const Antidopping({super.key, this.clubId});

  @override
  _AntidoppingState createState() => _AntidoppingState();
}

class _AntidoppingState extends State<Antidopping> {
  List<Map<String, dynamic>> playersList = [];
  int? clubId;
  int? _days = 0;

  @override
  void initState() {
    _days = 0;
    super.initState();
    getIsLogin().then((result) {
      setState(() {
        _isLogin = result;
      });
    });
    fetchPlayers(widget.clubId!, _days!).then((result) {
      setState(() {
        playersList = result;
      });
    });
  }

  void deletePlayer(int id, int clubId) async {
    // var url = Uri.parse('http://192.168.1.231:3000/seasons');
    var url = Uri.parse('http://localhost:3000/delete-player/$id');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      await fetchPlayers(clubId, 0);
      setState(() {});
    } else {
      throw Exception('Failed to delete player');
    }
  }

  // function to send GET request to API to get every player of this club
  Future<List<Map<String, dynamic>>> fetchPlayers(int clubId, int days) async {
    playersList.clear();
    int newDays;
    if (days == 0) {
      newDays = 99999999;
    } else {
      newDays = days;
    }
    // var url = Uri.parse('http://192.168.1.231:3000/contracts');
    var url = Uri.parse('http://localhost:3000/antidopping/$newDays/$clubId');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var players = json.decode(response.body)["results"];
      for (var i = 0; i < players.length; i++) {
        playersList.add({
          "id": players[i]["id"].toString(),
          "first_name": players[i]["first_name"].toString(),
          "last_name": players[i]["last_name"].toString(),
          "antidopping_date": players[i]["antidopping_date"].toString(),
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
        Navigator.pushReplacement(
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

  int daysSinceDate(String date) {
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
        title: const Text("Anti-Dopping Test Dates"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(labelText: "Days since test:"),
              onChanged: (value) {
                value.isEmpty ? value = "0" : value = value;
                fetchPlayers(widget.clubId!, int.parse(value)).then((result) {
                  setState(() {
                    playersList = result;
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
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
                          "Contracted at: ${playersList[index]["antidopping_date"]} (${daysSinceDate(playersList[index]["antidopping_date"]).toString()} days)"),
                      trailing: _isLogin
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deletePlayer(
                                int.parse(playersList[index]["id"]),
                                (widget.clubId!),
                              ),
                            )
                          : null,
                    )
                  ],
                );
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
