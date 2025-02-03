import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  @override
  createState() {
    return _TodoScreenState();
  }
}

class _TodoScreenState extends State<TodoScreen> {
  List<dynamic> todos = [];
  int currentPage = 1;
  int todoPerPage = 10;
  int totalTodos = 200;
  int totalPages = 20;
  bool isLoading = false;
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  //function to fetch data from API
  Future<void> fetchTodo() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_page=$currentPage&_limit=$todoPerPage');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        todos = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load todos");
    }
  }

  List<int> generatePageNumbers() {
    int startPage = ((currentPage - 1) ~/ 5) * 5 + 1;
    return List.generate(5, (index) => startPage + index)
        .where((page) => page <= totalPages)
        .toList();
  }

  Future<void> showEditDialog(BuildContext context, int index) async {
    final TextEditingController editController =
        TextEditingController(text: todos[index]["title"]);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Todo"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: "Title",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos[index]["title"] = editController.text;
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF183685),
                foregroundColor: Colors.white,
              ),
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void deleteTodo(BuildContext context, int index) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete Todo"),
            content: Text("Are you sure you wan to delete this todo?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Todos"),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF183685),
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                value: 2,
                color: Colors.blue,
              ))
            : Column(
                spacing: 12,
                children: [
                  Expanded(
                    //ListView Builder to display the data as a list
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        // print(todo['id']);
                        // print(todo['completed']);
                        // print(todo['title']);
                        //Todo Card displaying th data fetched from API
                        return InkWell(
                          onTap: () => print("click on $index"),
                          child: Card(
                            color: todo['completed']
                                ? Colors.grey.shade300
                                : Colors.grey.shade500,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: todo['completed'],
                                            activeColor: Color(0xFF183685),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                todos[index]['completed'] =
                                                    value;
                                              });
                                            }),
                                        Text(
                                          "ID: ${todo['id']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        //Edit Icon
                                        IconButton(
                                          onPressed: () =>
                                              {showEditDialog(context, index)},
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,
                                        ),

                                        //Delete Button
                                        IconButton(
                                          onPressed: () =>
                                              {deleteTodo(context, index)},
                                          icon: Icon(Icons.delete),
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Title: ${todo['title']}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: currentPage > 1
                                ? () {
                                    if (currentPage > 1) {
                                      setState(() {
                                        currentPage--;
                                      });
                                      fetchTodo();
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                shadowColor: Colors.black,
                                elevation: 4),
                            child: Text("Previous"),
                          ),
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: generatePageNumbers().length,
                                  itemBuilder: (context, index) {
                                    final pageNumber =
                                        generatePageNumbers()[index];
                                    return TextButton(
                                      onPressed: () {
                                        setState(() {
                                          currentPage = pageNumber;
                                          fetchTodo();
                                        });
                                      },
                                      child: Text(pageNumber.toString(),
                                          style: TextStyle(
                                            fontSize: currentPage == pageNumber
                                                ? 16
                                                : 14,
                                            fontWeight:
                                                currentPage == pageNumber
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            color: currentPage == pageNumber
                                                ? Color(0xFF183685)
                                                : Colors.black,
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: currentPage < totalPages
                                ? () {
                                    setState(() {
                                      currentPage++;
                                    });
                                    fetchTodo();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                shadowColor: Colors.black,
                                elevation: 4),
                            child: Text("Next"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}



// different method to do this 



// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'todo.dart';

// class TodoScreen extends StatefulWidget {
//   const TodoScreen({super.key});
//   @override
//   createState() {
//     return _TodoScreenState();
//   }
// }

// class _TodoScreenState extends State<TodoScreen> {
//   int _cureentPage = 0;
//   int _totalPage = 20;
//   List<Todo>? _todoList;

//   @override
//   void initState() {
//     super.initState();
//     fetchTodo(_cureentPage);
//   }

//   Future<List<Todo>> fetchTodo(int page) async {
//     final response = await http.get(Uri.parse(
//         'https://jsonplaceholder.typicode.com/todos?_start=${page * 10}&_limit=10'));
//     if (response.statusCode == 200) {
//       // print("Yes");
//       List<dynamic> json = jsonDecode(response.body);
//       return json.map((e) => Todo.fromJson(e)).toList();
//     } else {
//       // print("no");
//       throw Exception('Failed to load todo');
//     }
//   }

//   // void _deleteTodo(BuildContext context, int index) async {
//   //   final todos = await _todoList;
//   //   setState(() {
//   //     todos.removeAt(index);
//   //   });
//   //   Navigator.of(context).pop();
//   // }

//   void _deleteTodo(BuildContext context, int index) async {
//     print('deleting todo at $index');

//     print("this todo list $_todoList");
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Delete'),
//           content: Text('Are you sure you want to delete this todo?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _todoList?.removeAt(index);
//                   fetchTodo(_cureentPage);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Confirm'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Todo',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//         // backgroundColor: Colors.transparent,
//       ),
//       backgroundColor: Color(0xFFF1CFE4),
//       body: FutureBuilder(
//         future: fetchTodo(_cureentPage),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Todo> todos = snapshot.requireData;
//             // print(todos!.length);/
//             // print(_totalPage);
//             // print(_cureentPage);
//             // if (snapshot.connectionState == ConnectionState.waiting ) {
//             //   return Center(child: CircularProgressIndicator());
//             // } else if (snapshot.hasError) {
//             //   return Center(child: Text('Error:${snapshot.error}'));
//             // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             //   return Center(child: Text('No todos available'));
//             // }

//             return Column(
//               children: [
//                 Expanded(
//                     child: ListView.builder(
//                   itemCount: todos.length,
//                   itemBuilder: (context, index) {
//                     final todo = todos[index];

//                     return Card(
//                       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       elevation: 10.0,
//                       color: Colors.grey,
//                       child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "ID: ${todo.id}",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text("Title: ${todo.title}"),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 spacing: 5,
//                                 children: [
//                                   TextButton(
//                                     onPressed: () =>
//                                         print("on press Edit $index"),
//                                     child: Icon(
//                                       Icons.edit,
//                                       color: Colors.black,
//                                       size: 25,
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () =>
//                                         _deleteTodo(context, index),
//                                     child: Icon(
//                                       Icons.delete,
//                                       color: Colors.red,
//                                       size: 25,
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           )),
//                     );
//                   },
//                 )),
//                 Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: _cureentPage == 0
//                               ? null
//                               : () {
//                                   if (_cureentPage > 0) {
//                                     setState(() {
//                                       _cureentPage--;
//                                       fetchTodo(_cureentPage);
//                                     });
//                                   }
//                                 },
//                           child: Text('Previous'),
//                         ),
//                         Container(
//                           width: 500,
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: List.generate(_totalPage, (index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         _cureentPage = index;
//                                         fetchTodo(_cureentPage);
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: EdgeInsets.all(8),
//                                       padding: EdgeInsets.all(12),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey),
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: _cureentPage == index
//                                             ? Colors.blue
//                                             : Colors.grey,
//                                       ),
//                                       child: Text(
//                                         '${index + 1}',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: _cureentPage == index
//                                                 ? FontWeight.bold
//                                                 : FontWeight.normal,
//                                             color: _cureentPage == index
//                                                 ? Colors.white
//                                                 : Colors.black),
//                                       ),
//                                     ),
//                                   );
//                                 })),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: _cureentPage >= 19
//                               ? null
//                               : () {
//                                   if (_cureentPage < _totalPage - 1 &&
//                                       _cureentPage <= 19) {
//                                     setState(() {
//                                       _cureentPage++;
//                                       fetchTodo(_cureentPage);
//                                     });
//                                   }
//                                 },
//                           child: Text('Next'),
//                         ),
//                       ],
//                     )),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }