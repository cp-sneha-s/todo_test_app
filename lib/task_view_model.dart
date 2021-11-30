import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Task.dart';

class TaskViewModel  {
  DatabaseHelper dbInstance;
  List<Task> taskList= [];

  //static final TaskViewModel taskViewModel = TaskViewModel();

  TaskViewModel(){
    this.dbInstance= DatabaseHelper.instance;
    taskList = this.getTaskList();
  }

  List<Task> getTaskList() {
    DatabaseHelper.instance.getAllTasks().then((value) {
     this.taskList = value;
      print('got tasklist');
      print(taskList.toString());
    });
    return taskList;
  }

  void toggleDone(bool done) {
    done = !done;
  }


  void addTask (Task task){
    dbInstance.insert(task);
  }

  void deletetask(int index) {
   dbInstance.deleteTask(index);
  }
}