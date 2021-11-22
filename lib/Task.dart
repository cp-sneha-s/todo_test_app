import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';

final String tableTodo = 'todo';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDone = 'done';

class Task extends ChangeNotifier {



  int id;
  bool done;
  String title;

  Task({this.id, this.done, this.title});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnDone: done ? 1 : 0,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }



}
