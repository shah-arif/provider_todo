import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/todo_provider.dart';
import 'package:provider_todo/views/detailes_screen.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(todos.todos.length.toString(),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen()));
          }, icon: Icon(Icons.arrow_forward))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, 
            builder: (_)=>AlertDialog(
              title: Text("Add new todo"),
              content: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "title"),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(hintText: "description"),
                  ),
                  ElevatedButton(onPressed: (){
                    final title = _titleController.text;
                    final description = _descriptionController.text;
                    todos.addNewTodo(title, description);
                    Navigator.pop(context);
                  }, child: Text("Add"))
                ],
              ),
            ));
      },child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: todos.todos.length,
          itemBuilder: (context,index){
          return ListTile(
            title: Text(todos.todos[index].title),
            subtitle: Text(todos.todos[index].description),
            trailing: IconButton(onPressed: ()=>todos.deleteTodo(index), icon: Icon(Icons.close)),
          );
          }
      ),
    );
  }
}
