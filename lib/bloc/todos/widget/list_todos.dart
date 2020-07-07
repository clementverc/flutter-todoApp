import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/todos/model/todo.dart';
import 'package:flutter_todo_test/bloc/todos/widget/list_item.dart';
import 'package:provider/provider.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoProvider>(context).itemsList;
    return todoList.length > 0
        ? ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListItem(todoList[index]);
            },
          )
        : LayoutBuilder(
            builder: (ctx, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Aucune tache',
                    ),
                  ],
                ),
              );
            },
          );
  }
}
