import 'package:flutter/material.dart';
import 'package:flutter_app/todo_screen.dart';

class TodoList extends StatefulWidget {
  final String? username;
  const TodoList({super.key, this.username});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<TodoList> {
  //List to display the todo operations
  final List<String> todos = [];

  //Function to add todo item to list
  void addTodo() {
    TextEditingController todoController = TextEditingController();

    //Dialog box that enables user input
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Todo"),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(
              labelText: 'Todo',
            ),
          ),
          actions: [
            //Add Button
            TextButton(
              onPressed: () {
                setState(() {
                  if (todoController.text.isNotEmpty) {
                    todos.add(todoController.text);
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),

            //Cancel button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  //Function to perform edit operation
  void editTodo(int index) {
    TextEditingController todoController =
        TextEditingController(text: todos[index]);

    //Dialog box that displays the existing content of the todo
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit todo'),
            content: TextField(
              controller: todoController,
              decoration: InputDecoration(
                labelText: 'Todo',
              ),
            ),
            actions: [
              //Save button
              TextButton(
                onPressed: () {
                  setState(() {
                    if (todoController.text.isNotEmpty) {
                      todos[index] = todoController.text;
                    }
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),

              //Cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  //Delete operation
  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("ToDoList"),
        backgroundColor: Color(0xFF183685),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoScreen()));
              },
              child: Text(
                "TodoList",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.blue,
                textStyle:
                    TextStyle(color: const Color.fromARGB(255, 191, 32, 32)),
                minimumSize: Size(320, 50),
              ),
            ),
            //Welcome User message

            SizedBox(height: 30),
            Expanded(
              child: todos.isEmpty
                  ? Center(
                      child: Text(
                        'No todos yet.Add one using the add button!',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFDBDBDC), //todo background
                              borderRadius: BorderRadius.circular(
                                  15), //Todo container border
                            ),
                            child: ListTile(
                              title: Text(todos[index],
                                  style: TextStyle(fontSize: 18)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //Edit Icon
                                  IconButton(
                                    onPressed: () => editTodo(index),
                                    icon: Icon(Icons.edit),
                                    color: Colors.black,
                                  ),

                                  //Delete Button
                                  IconButton(
                                    onPressed: () => deleteTodo(index),
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      //FAB to add an item to the list
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Color(0xFF183685),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
