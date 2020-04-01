import 'package:flutter/material.dart';
import 'package:todolisterflutter/models/task_data.dart';
import 'package:todolisterflutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Consumer<TaskData>(
      builder: (context, tasksData, child)
      {
      return ListView.builder(
          itemCount: tasksData.taskCount,
          itemBuilder: (context, index) {
            final task = tasksData.task[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              triggerCallBack: (checkBoxState) {
                tasksData.updateTask(task);
              },
              triggerLongPress: (){
                showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Warning'),
                    content: Text('Are you sure you want to delete this item ?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Yes'),
                        onPressed: (){
                            tasksData.deleteTask(task);
                            Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text('No'),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                }
                );
              },
            );
          }
      );
    });
}
}