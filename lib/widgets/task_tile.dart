import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget{
  final bool isChecked;
  final String taskTitle;
  final Function triggerCallBack;
  final Function triggerLongPress;

  TaskTile({this.isChecked, this.taskTitle, this.triggerCallBack, this.triggerLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: triggerLongPress,
      title: Text(taskTitle,
      style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null
      ),
      ),
      trailing: Checkbox(
          activeColor: Colors.deepOrange,
          value: isChecked,
          onChanged: triggerCallBack,
      )
    );
  }
}
