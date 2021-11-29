import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Task.dart';

class TaskViewModel  {
  DatabaseHelper dbInstance;
  TaskViewModel( DatabaseHelper dbInstance ){
    this.dbInstance= DatabaseHelper.instance;
  }


  List<Task> taskList= [];


  List<Task> getTaskList( List<Task> newList) {
    dbInstance.getAllTasks().then((value) {
     value.map((e) => newList.add(e));
      print('got tasklist');
      print(taskList.toString());
    });
    return taskList;
  }

  void toggleDone(bool done) {
    done = !done;
  }


  void addTask (Task task){
    DatabaseHelper.instance.insert(task);
    taskList.add(task);
  }

  void deletetask(int index) {
   DatabaseHelper.instance.deleteTask(index);
     taskList.removeAt(index);

  }
}