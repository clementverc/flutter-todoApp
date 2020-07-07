import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/todos/model/todo.dart';
import 'package:flutter_todo_test/bloc/todos/widget/item_text.dart';
import 'package:flutter_todo_test/bloc/todos/widget/new_todo.dart';
import 'package:provider/provider.dart';

class ListItem extends StatefulWidget {
  final Todo todo;

  ListItem(this.todo);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<TodoProvider>(context, listen: false)
            .changeStatus(widget.todo.id);
      });
    }

    return Dismissible(
      key: ValueKey(widget.todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<TodoProvider>(context, listen: false)
            .removeTodo(widget.todo.id);
      },
      background: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'SUPPRIMER',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
              size: 28,
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: _checkItem,
        child: Container(
          height: 65,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: widget.todo.isDone,
                      onChanged: (_) => _checkItem(),
                    ),
                    ItemText(
                      widget.todo.isDone,
                      widget.todo.description,
                    ),
                  ],
                ),
                if (!widget.todo.isDone)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => NewTodo(
                          id: widget.todo.id,
                          isEditMode: true,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
