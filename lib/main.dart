import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:provider/provider.dart';
import 'ToDoPage.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context)=>Task(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: ToDoPage(),
    );
  }
}
