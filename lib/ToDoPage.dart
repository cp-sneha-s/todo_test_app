import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/DatabaseHelper.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:flutter_todo_app/task_view_model.dart';
import 'package:provider/provider.dart';
import 'AddTaskPage.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
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
        body: Consumer<TaskViewModel>(
          builder: (context,taskviewModel,child){
          return  FutureBuilder(
            future: taskviewModel.getTaskList(),
            builder: (context,snapshot){
              List<Task>  list = snapshot.data;
              if (snapshot.hasData){
               return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            taskviewModel.deletetask(list[index].id);
                          //  list.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.blueGrey,
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              final newvalue = !list[index].done;
                              list[index].done = newvalue;
                            });
                          },
                          title: list[index].done
                              ? Text(
                            list[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          )
                              : Text(
                            list[index].title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Checkbox(
                            value: list[index].done,
                            onChanged: (bool value) {
                              setState(() {
                                list[index].done = value;
                              });
                            },
                            activeColor: Colors.blueGrey,
                          ),
                        ),
                      );
                    });
              }else{
                throw Exception('Failed to load data');
              }
            },

          );
          }

        ),
      ),
    );
  }
}
