import 'package:flutter/material.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'counters',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ),
        body: Center(
          child: demoDude(),
        ),
      ),
    );
  }
}

class demoDude extends StatefulWidget {
  const demoDude({super.key});

  @override
  State<demoDude> createState() => _demoDudeState();
}

class _demoDudeState extends State<demoDude> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter>0)
      counter--;
       
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter:$counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.add), onPressed: increment),
            IconButton(icon: Icon(Icons.remove), onPressed: decrement),
          ],
        ),
      ],
    );
  }
}
