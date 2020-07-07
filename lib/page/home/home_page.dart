import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/widget/add_new_task.dart';
import 'package:flutter_todo_test/bloc/widget/list.dart';

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
            builder: (_) => AddNewTask(isEditMode: false),
          );
        },
      ),
    );
  }
}
