import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Count App'),
        ),
        body: const CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final _controller = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _incrementCounter() {
    _counter++;
    _controller.sink.add(_counter);
  }

  void _decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _controller.sink.add(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StreamBuilder<int>(
          stream: _controller.stream,
          initialData: _counter,
          builder: (context, snapshot) {
            return Text(
              'Counter: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green, // Customize the square's color
                borderRadius:
                    BorderRadius.circular(20.0), // Customize the square's shape
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white, // Customize the icon color
                ),
                onPressed: _incrementCounter,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red, // Customize the square's color
                borderRadius:
                    BorderRadius.circular(20.0), // Customize the square's shape
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white, // Customize the icon color
                ),
                onPressed: _decrementCounter,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
