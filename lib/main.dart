import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_bloc.dart';
import 'recipe_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => RecipeBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recipe List'),
          ),
          body: const RecipeList(),
        ),
      ),
    );
  }
}
