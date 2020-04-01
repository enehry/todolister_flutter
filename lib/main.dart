import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisterflutter/models/task_data.dart';
import 'package:todolisterflutter/screens/tasks_screen.dart';

void main() => runApp(TodoLister());

class TodoLister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

