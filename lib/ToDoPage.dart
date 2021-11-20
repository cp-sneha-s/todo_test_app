import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Task.dart';
import 'package:provider/provider.dart';

import 'AddTaskPage.dart';

class ToDoPage extends StatelessWidget {
  List<Task> myList ;
  @override
  Widget build(BuildContext context) {
    myList = Provider.of<Task>(context).getTaskList();
    print('${myList.toString()}');
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
        body: Consumer<Task>(builder: (context, task, child) {
          return ListView.builder(
              itemCount:task.getTaskList().length,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    (context).read<Task>().deletetask(index);
                    // task.deletetask(index);
                    myList.removeAt(index);
                    },
                  background: Container(
                    color: Colors.blueGrey,
                  ),
                  child: ListTile(
                    onTap: () {
                       // Provider.of<Task>(context).toggleDone(myList[index].done);
                       print('Listtile tapped!');
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
                        task.toggleDone(myList[index].done,);
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











// class ToDoPage extends StatefulWidget {
//   @override
//   _ToDoPageState createState() => _ToDoPageState();
// }
//
// class _ToDoPageState extends State<ToDoPage> {
//
//   List<Task> myList;
//
//   int count = 0;
//
//   @override
//   void didChangeDependencies() {
//
//     myList = Provider.of<Task>(context).getTaskList();
//     print('Todopage: ${myList.toString()}');
//
//     super.didChangeDependencies();
//   }
//
//   @override
//   void initState() {
//     setState(() {
//       myList = Provider.of<Task>(context).getTaskList();
//     });
//
//     super.initState();
//   }
//
//   // DatabaseHelper.instance.getAllTasks().then((myList) {
//   //   setState(() {
//   //     this.myList = myList;
//   //     this.count = myList.length;
//   //   });
//   // });
//
//   void deleteTask(int num) async {
//     await DatabaseHelper.instance.deleteTask(num);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           leading: Icon(Icons.list),
//           title: Text('Todo App'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AddTaskPage()));
//           },
//           backgroundColor: Colors.blueGrey,
//           child: Icon(Icons.add),
//         ),
//         body: Consumer<Task>(builder: (context, task, child) {
//           return ListView.builder(
//               itemCount:context.read(),
//               itemBuilder: (BuildContext context, index) {
//                 return Dismissible(
//                   key: UniqueKey(),
//                   onDismissed: (direction) {
//                     setState(() {
//                       deleteTask(myList[index].id);
//
//                       myList.removeAt(index);
//                       print(myList[index].id.toString());
//                       print(index.toString());
//                     });
//                   },
//                   background: Container(
//                     color: Colors.blueGrey,
//                   ),
//                   child: ListTile(
//                     onTap: () {
//                       setState(() {
//                         final newvalue = !myList[index].done;
//                         myList[index].done = newvalue;
//                       });
//                     },
//                     title: myList[index].done
//                         ? Text(
//                             myList[index].title,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w400,
//                                 decoration: TextDecoration.lineThrough),
//                           )
//                         : Text(
//                             myList[index].title,
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                     trailing: Checkbox(
//                       value: myList[index].done,
//                       onChanged: (bool value) {
//                         setState(() {
//                           task.taskList[index].done = value;
//                         });
//                       },
//                       activeColor: Colors.blueGrey,
//                     ),
//                   ),
//                 );
//               });
//         }),
//       ),
//     );
//   }
// }