// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:score/login_page.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  String _selectedFilter = 'All';

// List of items in our dropdown menu
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Players List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isLogin ? Icons.logout : Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                  onTap: () {
                    // Handle item click
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
