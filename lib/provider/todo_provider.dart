import 'package:flutter/cupertino.dart';
import 'package:provider_todo/model/todo.dart';

class TodoProvider extends ChangeNotifier{
  List <Todo> todos = [];

  addNewTodo(title,description){
    var newTodo = Todo(title: title, description: description);
    todos.add(newTodo);
    notifyListeners();
  }

  deleteTodo(index){
    todos.removeAt(index);
    notifyListeners();
  }
}