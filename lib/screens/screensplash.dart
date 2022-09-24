import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/main.dart';
import 'package:login/screens/screenhome.dart';
import 'package:login/screens/screenlogin.dart';

class screensplash extends StatefulWidget {
  const screensplash({Key? key}) : super(key: key);

  @override
  State<screensplash> createState() => _screensplashState();
}

class _screensplashState extends State<screensplash> {
  @override
  void initState() {
    gotologin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/flutter logo1.jpg"),
          ],
        ),
      ),
    ));
  }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => screenlogin(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkuserloggedin() async {
    final _sharedprefens = await SharedPreferences.getInstance();
    final _userloggedin = _sharedprefens.getBool("SAVE_KEY_NAME");
    if (_userloggedin == null || _userloggedin == false) {
      gotologin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => screenhome()));
    }
  }
}
