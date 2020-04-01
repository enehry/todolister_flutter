import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todolisterflutter/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Milk'),
  ];

  void addTask(String newTask){
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}