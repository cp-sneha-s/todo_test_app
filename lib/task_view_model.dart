import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Task.dart';

class TaskViewModel  extends ChangeNotifier{
  DatabaseHelper dbInstance;
  List<Task> taskList= [];



  TaskViewModel(DatabaseHelper dbInstance){
    this.dbInstance= DatabaseHelper.instance;
  }


  Future<List<Task>> getTaskList()async {
    DatabaseHelper.instance.getAllTasks().then((value) {
     this.taskList = value;
      print('got tasklist');
      print(taskList.toString());

    });
    return taskList;

  }

  void toggleDone(bool done) {
    done = !done;
    notifyListeners();
  }


  void addTask (Task task){
    dbInstance.insert(task);
    taskList.add(task);
    notifyListeners();
  }

  void deletetask(int index) {
   dbInstance.deleteTask(index);
   taskList.removeAt(index);
   notifyListeners();
  }
}