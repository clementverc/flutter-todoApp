import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/todos/model/todo.dart';
import 'package:provider/provider.dart';

class NewTodo extends StatefulWidget {
  final String id;
  final bool isEditMode;

  NewTodo({
    this.id,
    this.isEditMode,
  });

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  Todo todo;
  String _inputDescription;
  final _formKey = GlobalKey<FormState>();

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (!widget.isEditMode) {
        Provider.of<TodoProvider>(context, listen: false).createNewTodo(
          Todo(
            id: DateTime.now().toString(),
            description: _inputDescription,
          ),
        );
      } else {
        Provider.of<TodoProvider>(context, listen: false).editTodo(
          Todo(
            id: todo.id,
            description: _inputDescription,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    if (widget.isEditMode) {
      todo =
          Provider.of<TodoProvider>(context, listen: false).getById(widget.id);
      _inputDescription = todo.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Titre'),
            TextFormField(
              initialValue:
                  _inputDescription == null ? null : _inputDescription,
              decoration: InputDecoration(
                hintText: 'Description de la tache',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer un texte';
                }
                return null;
              },
              onSaved: (value) {
                _inputDescription = value;
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text(
                  !widget.isEditMode ? 'Ajouter' : 'Editer',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _validateForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
