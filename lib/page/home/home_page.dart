import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/todos/widget/list_todos.dart';
import 'package:flutter_todo_test/bloc/todos/widget/new_todo.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des taches'),
      ),
      body: List(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => NewTodo(isEditMode: false),
          );
        },
      ),
    );
  }
}
