import 'package:flutter/material.dart';

void main() => runApp(Yaswanth());

class Yaswanth extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Welcome Home'),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          color: Colors.red,
          margin: const EdgeInsets.all(30),
          //padding: EdgeInsetsDirectional.only(end: 100, top: 100, bottom: 30, start: 50),
          alignment: Alignment.center,

          child: const Text('veryGood Home',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.left),
        ),
        floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () => {},),
      ),
    );
  }
}
