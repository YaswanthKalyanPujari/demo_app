import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Item Count'),
        ),
        body: const MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Change this to the number of items you want.
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: () {
            ('Item $index tapped');
          },
        );
      },
    );
  }
}
