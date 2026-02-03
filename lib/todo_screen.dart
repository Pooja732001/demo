import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController todoController = TextEditingController();
  List<String> todoList = [];
  int? editText;

  void addOrUpdateTodo() {
    if (todoController.text.isEmpty) return;
    setState(() {
      if (editText == null) {
        todoList.add(todoController.text);
      } else {
        todoList[editText!] = todoController.text;
        editText = null;
      }
      todoController.clear();
    });
  }

  void editTodo(int index) {
    todoController.text = todoList[index];
    editText = index;
  }

  void deleteTodo(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(


        title: Center(child: Text("Todo Add",style: TextStyle(fontSize: 30),)),
      ) 
      ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 30,),

            TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: "Enter todo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: addOrUpdateTodo,
              child: Text(editText == null ? "Add todo" : "updateTodo"),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,

                itemBuilder: (context, index) {
                  return Card(
                    color: getRandomColor(),
                    child: ListTile(
                      title: Text(todoList[index],style: TextStyle(color: Colors.white),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => editTodo(index),
                            icon: Icon(Icons.edit,color: Colors.white,),
                          ),
                          IconButton(
                            onPressed: () => deleteTodo(index),
                            icon: Icon(Icons.delete,color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
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
