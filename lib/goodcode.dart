import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  @override
  _RunMyAppState createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  List<Map<String, dynamic>> _data = [{'title': 'Loading...'}];

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      setState(() {
        _data = body.map((post) {
          return {
            'userId': post['userId'],
            'id': post['id'],
            'title': post['title'],
            'body': post['body'],
          };
        }).toList();
      });
    } else {
      setState(() {
        _data = [{'title': 'Failed to fetch data'}];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Json data',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Json data'),
        ),
        body: Center(
          child: _data[0]['title'] == 'Loading...'
              ? const CircularProgressIndicator() // Show a loading indicator
              : ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final post = _data[index];
                    return ListTile(
                      title: Text('Title: ${post['title']}',style: const TextStyle(fontWeight:FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User ID: ${post['userId']}',style: const TextStyle(fontWeight:FontWeight.w100),),
                          Text('ID: ${post['id']}',style: const TextStyle(fontSize: 18),),
                          Text('Body: ${post['body']}',style: const TextStyle(fontSize: 22)),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
