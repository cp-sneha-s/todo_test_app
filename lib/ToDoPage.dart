import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'AddTaskPage.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Task> myList =[];

  int count = 0;
 TaskViewModel taskViewModel = TaskViewModel();

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   myList = TaskViewModel.taskViewModel.taskList;
    //   print(myList.length);
    // });

    // setState(() {
    //   myList = taskViewModel.taskList;
    //   print(myList.length.toString());
    // });

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
        body: ListView.builder(
            itemCount: taskViewModel.taskList.length,
            itemBuilder: (BuildContext context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    taskViewModel.deletetask(taskViewModel.taskList[index].id);
                    taskViewModel.taskList.removeAt(index);

                    print(taskViewModel.taskList[index].id.toString());
                    print(index.toString());
                  });
                },
                background: Container(
                  color: Colors.blueGrey,
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      final newvalue = !taskViewModel.taskList[index].done;
                      taskViewModel.taskList[index].done = newvalue;
                    });
                  },
                  title: taskViewModel.taskList[index].done
                      ? Text(
                    taskViewModel.taskList[index].title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough),
                        )
                      : Text(
                    taskViewModel.taskList[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  trailing: Checkbox(
                    value: taskViewModel.taskList[index].done,
                    onChanged: (bool value) {
                      setState(() {
                        taskViewModel.taskList[index].done = value;
                      });
                    },
                    activeColor: Colors.blueGrey,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
