// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_app/todo_provider.dart';

// class BookmarkScreen extends StatelessWidget {
//   final List<dynamic> data;
//   BookmarkScreen({required this.data});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bookmarked Todos"),
//       ),
//       body: Consumer<TodoProvider>(
//         builder: (context, todoProvider, child) {
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final todo = data[index];
//               //Todo Card displaying th data fetched from API
//               return Card(
//                 color: todo['completed']
//                     ? Colors.grey.shade300
//                     : Colors.grey.shade500,
//                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "ID: ${todo['id']}",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         SizedBox(height: 2),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Text(
//                             "Title: ${todo['title']}",
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
