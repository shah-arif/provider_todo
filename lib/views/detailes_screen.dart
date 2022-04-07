import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/todo_provider.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);
    return Scaffold(
      body: Center(
        child: Text(todos.todos.length.toString(),style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
