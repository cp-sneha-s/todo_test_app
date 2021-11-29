import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/ToDoPage.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:provider/provider.dart';


class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final addTaskController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    addTaskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Task',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: TextField(
                  key: Key('add task'),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Add Task Title', border: OutlineInputBorder()),
                  controller: addTaskController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          key: Key('cancel button'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueGrey)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          )),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      child:ElevatedButton(
                            key: Key('add task button'),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blueGrey)),
                            onPressed: () {
                              if (addTaskController.text.isEmpty) {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Please enter task'),
                                      );
                                    });
                              } else {
                                {
                                  Task task = Task(title: addTaskController.text,done: false);
                             DatabaseHelper.instance.insert(task);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ToDoPage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            )),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
