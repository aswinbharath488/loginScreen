import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/main.dart';

import 'screenhome.dart';

class screenlogin extends StatefulWidget {
  const screenlogin({Key? key}) : super(key: key);

  @override
  State<screenlogin> createState() => _screenloginState();
}

final _usernamecontroller = TextEditingController();
final _passwordcontoller = TextEditingController();
bool _isdatamatched = true;
final _formkey = GlobalKey<FormState>();

class _screenloginState extends State<screenlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 50),
                ),
                Image.asset(
                  "assets/flutter logo1.jpg",
                  height: 300,
                  width: 300,
                ),
                TextFormField(
                  controller: _usernamecontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontoller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isdatamatched,
                      child: Text("username password doesnt match"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checklogin(context);
                          } else {
                            print("doesnt match");
                          }
                        },
                        child: Text("login"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext context) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontoller.text;

    if (_username == _password) {
      final _sharedprefens = await SharedPreferences.getInstance();
      await _sharedprefens.setBool("SAVE_KEY_NAME", true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => screenhome()),
        ),
      );
    } else {
      print("username password doesnt match");
      ScaffoldMessenger(ctx1) {
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("error"),
          behavior: SnackBarBehavior.floating,
        );
      }
    }
  }
}
