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

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  // function to send POST request to API with form params
  Future<void> sendApiCallWithParams(
      String firstName,
      String lastName,
      int height,
      int weight,
      String birthday,
      String education,
      int passport) async {
    var url = Uri.parse('http://192.168.1.64:3000/users');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'height': height,
        'weight': weight,
        'birthday': birthday,
        'education': education,
        'passport': passport,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to insert into the users table');
    }
  }

// ----------------- Modal data ------------------------- //
  TextEditingController dateinput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _birthDay = '';
  String _education = '';
  int _height = 0;
  int _weight = 0;
  int _passport = 0;
  // ----------------- END OF data ------------------------- //

// ----------------- START OF MODAL ------------------------- //
  _showFullModal(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible:
          false, // should dialog be dismissed when tapped outside
      barrierLabel: "Modal", // label for barrier
      transitionDuration: const Duration(
          milliseconds:
              500), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "ADD A NEW PLAYER",
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Overpass',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0.0,
          ),
          backgroundColor: Colors.white.withOpacity(0.90),
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xfff8f8f8),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Primeiro e ultimo nome
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _firstName = value!,
                                  decoration: const InputDecoration(
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _lastName = value!,
                                  decoration: const InputDecoration(
                                    labelText: 'Last Name',
                                  ),
                                  obscureText: false,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        //Peso e altura
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Please enter your height';
                                    } else if (int.parse(value!) < 130 ||
                                        int.parse(value) > 250) {
                                      return 'Please enter a valid height';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                      _height = int.parse(value!),
                                  decoration: const InputDecoration(
                                    labelText: 'Height (cm)',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Please enter your weight';
                                    } else if (int.parse(value!) < 50 ||
                                        int.parse(value) > 160) {
                                      return 'Please enter a valid weight';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                      _weight = int.parse(value!),
                                  decoration: const InputDecoration(
                                    labelText: 'Weight (kg)',
                                  ),
                                  obscureText: false,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        // Data de nascimento
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                controller:
                                    dateinput, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "Birth Date" //label text of field
                                    ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2002),
                                      firstDate: DateTime(
                                          1940), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2008));

                                  if (pickedDate != null) {
                                    _birthDay = DateFormat('yyyy-MM-dd')
                                        .format(pickedDate)
                                        .toString();

                                    setState(() {
                                      dateinput.text =
                                          _birthDay; //set output date to TextField value.
                                    });
                                  }
                                },
                              )),
                              const SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        //Ano de escolaridade
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Please enter your education level';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _education = value!,
                                  decoration: const InputDecoration(
                                    labelText: 'Education level',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                            ],
                          ),
                        ),
                        // Passaporte
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == '') {
                                      if (value!.length < 9) {
                                        return 'Please enter your passport number';
                                      }
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                      _passport = int.parse(value!),
                                  decoration: const InputDecoration(
                                    labelText: 'Passport number',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await sendApiCallWithParams(
                                  _firstName,
                                  _lastName,
                                  _height,
                                  _weight,
                                  _birthDay,
                                  _education,
                                  _passport);
                              Navigator.of(context).pop();
                            } else {
                              // Show a popup indicating login failure
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Add player failed"),
                                    content: const Text(
                                        "Credentials empty or invalid"),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Add Player"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // ----------------- END OF MODAL ------------------------- //

  List<Map<String, dynamic>> seasonsList = [];
  List<String> playersList = [];
  List<String> playersFirstName = [];
  List<String> playersLastName = [];
  List<String> playersImage = [];
  String dropdownvalue = '';

  @override
  void initState() {
    dateinput.text = "";
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
        dropdownvalue = seasonsList[0]['id'];
      });
    });

    fetchPlayers(1, 1).then((result) {
      setState(() {
        playersList = result;
      });
    });
  }

  // function to send GET request to API to get every Season
  Future<List<Map<String, dynamic>>> fetchSeasons() async {
    // var url = Uri.parse('http://192.168.1.231:3000/seasons');
    var url = Uri.parse('http://192.168.1.64:3000/seasons');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var seasons = json.decode(response.body);
      for (var i = 0; i < seasons.length; i++) {
        seasonsList.add(
          {
            "id": seasons[i]['id'].toString(),
            "name": seasons[i]['name'].toString(),
          },
        );
      }
      return seasonsList;
    } else {
      throw Exception('Failed to load seasons');
    }
  }

  // function to send GET request to API to get every player of this club
  Future<List<String>> fetchPlayers(int clubId, int seasonId) async {
    // var url = Uri.parse('http://192.168.1.231:3000/seasons');
    var url = Uri.parse('http://192.168.1.64:3000/players/1/$seasonId');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var players = json.decode(response.body);
      for (var i = 0; i < players.length; i++) {
        playersFirstName.add(players[i]["first_name"].toString());
        playersLastName.add(players[i]["last_name"].toString());
        playersImage.add(players[i]["photo"].toString());
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
        title: const Text("Competitions"),
        actions: <Widget>[
          _isLogin
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () {
                      // Add player modal
                      _showFullModal(context);
                    },
                  ),
                )
              : Container(),
        ],
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

                  items: seasonsList.map((Map<String, dynamic> items) {
                    return DropdownMenuItem(
                      value: items['id'],
                      child: Text(items['name']),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (dynamic newValue) {
                    setState(() {
                      dropdownvalue = newValue;
                      fetchPlayers(1, int.parse(dropdownvalue)).then((result) {
                        setState(() {
                          playersList = result;
                        });
                      });
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playersFirstName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${playersFirstName[index]} ${playersLastName[index]}"),
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
