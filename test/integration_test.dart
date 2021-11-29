// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/ToDoPage.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

// import 'package:flutter_todo_app/main.dart';
// import 'package:integration_test/integration_test.dart';
//
// void main() {
//   // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   group('test task page', (){
//     testWidgets('Tap on FAB open addtaskpage ', (WidgetTester tester)async{
//       await tester.pumpWidget(MyApp());
//
//       await tester.tap(find.byIcon(Icons.add));
//       await tester.pump();
//
//     });
//   });
// }

class dbtester implements TaskViewModel{
  @override
  DatabaseHelper dbInstance;

  @override
  List<Task> taskList;


  @override
  void addTask(Task task) {
    // TODO: implement addTask
  }

  @override
  void deletetask(int index) {
    // TODO: implement deletetask
  }

  @override
  List<Task> getTaskList() {
    // TODO: implement getTaskList
    throw UnimplementedError();
  }



  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  void toggleDone(bool done) {
    // TODO: implement toggleDone
  }

}