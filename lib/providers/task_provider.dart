import 'package:flutter/material.dart';
import 'package:todo_list_app/model/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> tasks = [];

  get getTasks{
    return tasks;
  }

  addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  removeTask(int index){
    tasks.removeAt(index);
    notifyListeners();
  }
}