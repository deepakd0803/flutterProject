// import 'package:flutter/material.dart';

// class TodoProvider with ChangeNotifier {
//   List<String> _todos = [];
//   List<String> _bookmarkedTodos = [];

//   List<String> get todos => _todos;
//   List<String> get bookmarkedTodos => _bookmarkedTodos;

//   void addTodo(String todo) {
//     _todos.add(todo);
//     notifyListeners();
//   }

//   void bookmarkTodo(String todo) {
//     if (_bookmarkedTodos.contains(todo)) {
//       _bookmarkedTodos.remove(todo);
//     } else {
//       _bookmarkedTodos.add(todo);
//     }
//     notifyListeners();
//   }
// }
