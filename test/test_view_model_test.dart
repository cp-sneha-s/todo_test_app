import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:mockito/mockito.dart';


class MockDatabaseheler extends Mock implements DatabaseHelper {}

void main(){
    TaskViewModel taskViewModel;

    setUp((){
        final mockDatabase = MockDatabaseheler();
        taskViewModel = TaskViewModel(mockDatabase);
    });


    group('test the taskViewModel', (){
        test('item is added to taskList', (){
         Task task1 = Task(done: false,title: '0000');
         Task task2 = Task(done: false,title: '1111');
         Task task3 = Task(done: false,title: '2222');

            taskViewModel.addTask(task1);
            taskViewModel.addTask(task2);
            taskViewModel.addTask(task3);
           expect(taskViewModel.taskList.length, 3);
        });
    })
;
}