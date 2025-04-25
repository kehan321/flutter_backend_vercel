import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _todoController = TextEditingController();
  List<String> _todos = [];

  Future<void> _fetchTodos() async {
    final url = 'http://192.168.18.35:3000/api/todos?email=your_email_here'; // replace with your email
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _todos = responseData['todos'].cast<String>();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseData['error'])));
    }
  }

  Future<void> _addTodo() async {
    final url = 'http://192.168.18.35:3000/api/todo';
    final response = await http.post(Uri.parse(url), body: {
      'email': 'your_email_here', // replace with your email
      'todoItem': _todoController.text,
    });

    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Todo added successfully')));
      _fetchTodos(); // Reload todos after adding a new one
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseData['error'])));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _todoController, decoration: InputDecoration(labelText: 'Enter Todo')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _addTodo, child: Text('Add Todo')),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(_todos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
