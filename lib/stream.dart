import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StreamController<String> _streamController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(_streamController),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final StreamController<String> streamController;

  MyHomePage(this.streamController);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    widget.streamController.close(); // Close the stream controller to prevent memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Example'),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: widget.streamController.stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Text('Data from stream: ${snapshot.data}');
            } else {
              return Text('No data yet.');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add data to the stream when the button is pressed
          widget.streamController.sink.add('Hello, World!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

