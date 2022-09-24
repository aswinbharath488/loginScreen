import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/screens/screenaccounts.dart';
import 'package:login/screens/screenmain.dart';
import 'package:login/screens/screensettings.dart';

class screenhome extends StatefulWidget {
  screenhome({Key? key}) : super(key: key);

  @override
  State<screenhome> createState() => _screenhomeState();
}

class _screenhomeState extends State<screenhome> {
  int _currentselectedindex = 0;
  final _pages = [
    screenmain(),
    screensettings(),
    screenaccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentselectedindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentselectedindex,
          onTap: (newindex) {
            setState(() {
              _currentselectedindex = newindex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "account")
          ]),
    );
  }
}
