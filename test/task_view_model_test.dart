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





void main(){
  TaskViewModel taskVm;
 MockitoDatabase mockitodb;

  setUp((){
    mockitodb = MockitoDatabase();
    taskVm= TaskViewModel(mockitodb);

  });
  group('Testing ToDo App', (){
    test('A new item should be added',(){
      Task newTask = Task(done: false,title: 'go to gym');
      taskVm.addTask(newTask);
      expect(taskVm.taskList.contains(newTask), true);
      taskVm.deletetask(newTask.id);
      expect(taskVm.taskList.contains(newTask), false);
    });
    test('item should be delete from list', (){
      when(taskVm.getTaskList(),)
    });
  });
}