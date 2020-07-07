import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/model/task.dart';
import 'package:flutter_todo_test/bloc/widget/list_item.dart';
import 'package:provider/provider.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return taskList.length > 0
        ? ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return ListItem(taskList[index]);
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
