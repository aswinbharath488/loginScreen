import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class counter extends StatelessWidget {
  counter({Key? key}) : super(key: key);

 ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (BuildContext ctx, int newvalue, Widget? child) {
              return Text("$newvalue");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _imcrement();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _imcrement() {
    _counter.value = _counter.value + 1;
  }

  Future<void> showbottomsheet(BuildContext ctx) async {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          width: double.infinity,
          height: 500,
          color: Color.fromARGB(255, 195, 221, 241),
          child: ListView(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: Text("close"),
              ),
            ],
          ),
        );
      },
    );
  }
}
