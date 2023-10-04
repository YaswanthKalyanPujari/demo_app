import 'package:flutter/material.dart';

// function to trigger app build
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
final appTitle = 'Flutter Drawer Demo';

const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: appTitle,
	home: MyHomePage(title: appTitle),
	); // MaterialApp
}
}

class MyHomePage extends StatelessWidget {
final String title;

const MyHomePage({Key? key, required this.title}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Text(title),
		backgroundColor: Colors.green,
	),
	body: const Center(
		child: Text(
		'flutter fundamentals.',
		style: TextStyle(fontSize: 20.0),
	)),
	drawer: Drawer(
		child: ListView(
		padding: const EdgeInsets.all(0),
		children: [
			const DrawerHeader(
			decoration: BoxDecoration(
				color: Colors.green,
			), //BoxDecoration
			child: UserAccountsDrawerHeader(
				decoration: BoxDecoration(color: Colors.green),
				accountName: Text(
				"Yaswanth Kalyan",
				style: TextStyle(fontSize: 18),
				),
				accountEmail: Text("yaswanthkalyan004@gmail.com"),
				currentAccountPictureSize: Size.square(50),
				currentAccountPicture: CircleAvatar(
				backgroundColor: Color.fromARGB(255, 165, 255, 137),
				child: Text(
					"YK",
					style: TextStyle(fontSize: 30.0, color: Colors.blue),
				), //Text
				), //circleAvatar
			), //UserAccountDrawerHeader
			), //DrawerHeader
			ListTile(
			leading: const Icon(Icons.person),
			title: const Text(' My Profile '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.book),
			title: const Text(' My Learning'),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.workspace_premium),
			title: const Text(' TO DO LIST '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.video_label),
			title: const Text(' Saved Videos '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.edit),
			title: const Text(' Edit Profile '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.logout),
			title: const Text('LogOut'),
			onTap: () {
				Navigator.pop(context);
			},
			),
		],
		),
	), //Drawer
	);
}
}
