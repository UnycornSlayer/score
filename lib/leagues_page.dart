// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:score/login_page.dart';
import 'package:score/players_page.dart';

class LeaguesPage extends StatefulWidget {
  const LeaguesPage({super.key});

  @override
  _LeaguesPageState createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  Future<bool> getIsLogin() async {
    return await FlutterSession().get("isLogin");
  }

  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    getIsLogin().then((result) {
      setState(() {
        _isLogin = result;
      });
    });
  }

  String _selectedFilter = 'All';

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => SearchPage(),
        //   ),
        // );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlayersPage(),
          ),
        );
        break;
      case 2:
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
        title: const Text("Competitions"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeaguesPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/320px-Flag_of_Portugal.svg.png",
                          scale: 1.5,
                        ),
                      ),
                      title: const Text('Liga Portugal Bwin'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeaguesPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/320px-Flag_of_Portugal.svg.png",
                          scale: 1.5,
                        ),
                      ),
                      title: const Text('Liga Portugal SABSEG'),
                    ),
                  ),
                )
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
