import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisterflutter/models/task_data.dart';
import 'package:todolisterflutter/screens/add_task_screen.dart';
import 'package:todolisterflutter/widgets/task_list.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      radius: 30.0,
                      child: Icon(
                          Icons.list,
                          size: 40.0,
                          color: Colors.deepOrange,
                      ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 20.0),
                  Text('Todo Lister',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount.toString()} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
                    ),
                  ),
                child: TaskList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskScreen(),
              );
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
            Icons.add,
            color: Colors.white,
        ),
      ),
    );
  }
}



