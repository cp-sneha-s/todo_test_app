import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:provider/provider.dart';

import 'AddTaskPage.dart';
import 'DatabaseHelper.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Task> myList = [];

  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.getAllTasks().then((myList) {
      setState(() {
        this.myList = myList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: Icon(Icons.list),
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskPage()));
          },
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add),
        ),
        body: Consumer<TaskViewModel>(builder: (context, taskViewModel, child) {
          return ListView.builder(
              itemCount: myList.length,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      taskViewModel.deletetask(myList[index].id);
                      myList.removeAt(index);

                      print(myList[index].id.toString());
                      print(index.toString());
                    });
                  },
                  background: Container(
                    color: Colors.blueGrey,
                  ),
                  child: ListTile(
                    onTap: () {
                      taskViewModel.toggleDone(myList[index].done);
                      setState(() {
                        final newvalue = !myList[index].done;
                        myList[index].done = newvalue;
                      });
                    },
                    title: myList[index].done
                        ? Text(
                            myList[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          )
                        : Text(
                            myList[index].title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    trailing: Checkbox(
                      value: myList[index].done,
                      onChanged: (bool value) {
                        setState(() {
                          myList[index].done = value;
                        });
                      },
                      activeColor: Colors.blueGrey,
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
