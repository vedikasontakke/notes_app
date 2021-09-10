import 'package:flutter/material.dart';

// Every component in Flutter is a widget
// even the whole app itself is just a widget

// starting point of main fun
//todo :- learn about this arrow function in Data
void main() => runApp(App());

//  widgets whose state can not be altered once they are built
// These widgets are immutable (can't change) once they are built

//stateless => cant modify
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //An application that uses material design.
    return MaterialApp(title: 'To-Do List', home: TodoList());
  }
}

///  When flutter wants to update a widget, it will rebuild the entire widget.
///  To save state we would need two classes, one for the widget itself and one which creates the state.

//todo learn about abstract class and interface and really in details
//find why after extending the class we need to override its method
//if know this pls write in comments
// stateful => can be modify(muttable)
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //listView
  final List<String> _todoList = <String>[];
  //editText
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //used to implements the basic material design visual layout structure. ...
    // This widget is able to occupy the whole device screen.
    // In other words, we can say that it is mainly responsible for creating a base to the app screen
    // on which the child widgets hold on and render on the screen.
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _addTodoItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // Generate list of item widgets which can be visible
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  /* // Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context)  {
   return showDialog? (
        context:  context,
        builder: (BuildContext context)

    {
      return AlertDialog(
        title: const Text('Add a task to your list'),
        content: TextField(
          controller: _textFieldController,
          decoration: const InputDecoration(hintText: 'Enter task here'),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('ADD'),
            onPressed: () {
              Navigator.of(context).pop();
              _addTodoItem(_textFieldController.text);
            },
          ),
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    },
    );
  }
}

