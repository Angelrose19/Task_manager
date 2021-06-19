
import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList(
        class , TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  // This will be called each time the + button is pressed
  void _addTodoItem(String task){
    if(task.length>0){
      setState(() => _todoItems.add(task));
    }
  } 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
    ),
    ),
      body: _buildTodoScreen(){
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text('Add a new Task')
                ),
                body: new TextField(
                  autofocus: true,
                  onSubmitted: (val) {
                    _addTodoItem(val);
                    Navigator.pop(context);
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter something to do..!',
                    contentPadding: const EdgeInsets.all(16.0)
                  
                  ),
                )
              );
            }
          )
        );
      }
  
   void _removeTodoItem(int index) {
  setState(() => _todoItems.removeAt(index));
}

// Show an alert dialog asking the user to confirm that the task is done
void _promptRemoveTodoItem(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Mark "${_todoItems[index]}" as done?'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop()
          ),
          new FlatButton(
            child: new Text('MARK AS DONE'),
            onPressed: () {
              _removeTodoItem(index);
              Navigator.of(context).pop();
            }
          )
        ]
      );
    }
  );
}

Widget _buildTodoList() {
  return new ListView.builder(
    itemBuilder: (context, index) {
      if(index < _todoItems.length) {
        return _buildTodoItem(_todoItems[index], index);
      }
    },
  );
}

Widget _buildTodoItem(String todoText, int index) {
  return new ListTile(
    title: new Text(todoText),
    onTap: () => _promptRemoveTodoItem(index)
  );
}
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {
    return new ListTile(
      title: new Text(todoText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
}
      )
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      )
    );
  }
}