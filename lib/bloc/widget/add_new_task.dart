import 'package:flutter/material.dart';
import 'package:flutter_todo_test/bloc/model/task.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  final String id;
  final bool isEditMode;

  AddNewTask({
    this.id,
    this.isEditMode,
  });

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Task task;
  String _inputDescription;
  final _formKey = GlobalKey<FormState>();

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (!widget.isEditMode) {
        Provider.of<TaskProvider>(context, listen: false).createNewTask(
          Task(
            id: DateTime.now().toString(),
            description: _inputDescription,
          ),
        );
      } else {
        Provider.of<TaskProvider>(context, listen: false).editTask(
          Task(
            id: task.id,
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
      task =
          Provider.of<TaskProvider>(context, listen: false).getById(widget.id);
      _inputDescription = task.description;
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
