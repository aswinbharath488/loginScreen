import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bottamnavigation extends StatefulWidget {
  const bottamnavigation({Key? key}) : super(key: key);

  @override
  State<bottamnavigation> createState() => _bottamnavigationState();
}

class _bottamnavigationState extends State<bottamnavigation> {
  int _selectedcurrentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.red,
        onTap: (newvalue) {
          setState(() {
            _selectedcurrentindex = newvalue;
          });
        },
        currentIndex: _selectedcurrentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ],
      ),
    );
  }
}
