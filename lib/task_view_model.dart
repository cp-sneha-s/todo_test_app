

import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';
import 'Task.dart';

class TaskViewModel extends ChangeNotifier{
  DatabaseHelper dbInstance = DatabaseHelper.instance;
  TaskViewModel({this.dbInstance});
  List<Task> taskList= [];


  List<Task> getTaskList(List<Task> taskList) {
    DatabaseHelper.instance.getAllTasks().then((value) {
      this.taskList = value;
      notifyListeners();
      print('got tasklist');
      print(taskList.toString());
    });
    return taskList;
  }

  void toggleDone(bool done) {
    done = !done;
    notifyListeners();
  }

  void addTask(String tasktitle) {
 //   DatabaseHelper.instance.insert(Task(done: false, title: tasktitle));
    taskList.add(Task(done: false,title: tasktitle));
    notifyListeners();

  }

  void deletetask(int index) {
   // DatabaseHelper.instance.deleteTask(index);
    taskList.removeAt(index);
    notifyListeners();
  }
}