// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import 'package:score/leagues_page.dart';

var session = FlutterSession();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 100,
                        width: 500,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      // validator: (value) {
                      //   if (value != null) {
                      //     if (value.length < 6) {
                      //       return 'Password must be at least 6 characters';
                      //     }
                      //   }
                      //   return null;
                      // },
                      onSaved: (value) => _password = value ?? '',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              session.set("isLogin", false);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LeaguesPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // adding color will hide the splash effect
                                // color: Colors.blueGrey.shade200,
                              ),
                              child: const Text(
                                "Continue as Guest!",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(28, 75, 130, 100),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (_email == '1' && _password == '1') {
                            session.set("isLogin", true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeaguesPage(),
                              ),
                            );
                          } else {
                            // Show a popup indicating login failure
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Login Failed"),
                                  content: const Text(
                                      "Email or Password is incorrect."),
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
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
