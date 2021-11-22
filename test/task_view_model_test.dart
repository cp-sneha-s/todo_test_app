import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/ToDoPage.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';


class MockitoDatabase extends Mock implements DatabaseHelper{}

TaskViewModel taskVM;
Widget createMainScreen()=> ChangeNotifierProvider<TaskViewModel>(
    create: (context){
      taskVM = TaskViewModel();
      return taskVM;
    },
child: MaterialApp(
  home: ToDoPage(),
),);

void add(){
  taskVM.addTask('go to gym');
  taskVM.addTask('running');
  taskVM.addTask('cycling');
}


void main(){
  group('Testing ToDo App', (){
    test('A new item should be added',(){
      add();
      Task newTask = Task(done: false,title: 'go to gym');
      expect(taskVM.taskList.contains(newTask), true);
    });
  });
}