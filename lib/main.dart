import 'package:flutter/material.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:provider/provider.dart';
import 'ToDoPage.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (context)=>TaskViewModel(DatabaseHelper.instance) ,
        child: MaterialApp(
          darkTheme: ThemeData.dark(),
          home: ToDoPage(),
        ),
      );
  }
}
