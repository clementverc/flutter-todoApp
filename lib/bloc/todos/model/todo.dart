import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  final String id;
  String description;
  bool isDone;
  DateTime dayDate;

  Todo({
    @required this.id,
    @required this.description,
    this.isDone = false,
    this.dayDate,
  });
}

class TodoProvider with ChangeNotifier {
  List<Todo> get itemsList {
    return _toDoList;
  }

  final List<Todo> _toDoList = [];

  Todo getById(String id) {
    return _toDoList.firstWhere((todo) => todo.id == id);
  }

  void createNewTodo(Todo todo) {
    final newTodo = Todo(
      id: todo.id,
      description: todo.description,
      dayDate: todo.dayDate,
    );
    _toDoList.add(newTodo);
    notifyListeners();
  }

  void editTodo(Todo todo) {
    removeTodo(todo.id);
    createNewTodo(todo);
  }

  void removeTodo(String id) {
    _toDoList.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _toDoList.indexWhere((todo) => todo.id == id);
    _toDoList[index].isDone = !_toDoList[index].isDone;
  }
}
