import 'package:flutter/material.dart';
import 'login_page.dart';
import 'players_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayersPage(),
    );
  }
}
