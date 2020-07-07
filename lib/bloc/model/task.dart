import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  final String id;
  String description;
  bool isDone;

  Task({
    @required this.id,
    @required this.description,
    this.isDone = false,
  });
}

class TaskProvider with ChangeNotifier {
  List<Task> get itemsList {
    return _toDoList;
  }

  final List<Task> _toDoList = [];

  Task getById(String id) {
    return _toDoList.firstWhere((task) => task.id == id);
  }

  void createNewTask(Task task) {
    final newTask = Task(
      id: task.id,
      description: task.description,
    );
    _toDoList.add(newTask);
    notifyListeners();
  }

  void editTask(Task task) {
    removeTask(task.id);
    createNewTask(task);
  }

  void removeTask(String id) {
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _toDoList.indexWhere((task) => task.id == id);
    _toDoList[index].isDone = !_toDoList[index].isDone;
  }
}
