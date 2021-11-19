import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/Task.dart';

void main(){
  group('Testing ToDo App', (){
    Task task = Task();
    
    test('A new item should be added',(){
      String taskName = 'buy clothes';
  task.addTask(taskName);
      expect(task.getTaskList().contains(taskName), false);
    });
  });
}