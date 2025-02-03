// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/retry.dart';

// class DemoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var names = [
//       {
//         'id': 1,
//         'name': 'deepak',
//       },
//       {
//         'id': 2,
//         'name': 'arun',
//       },
//       {
//         'id': 3,
//         'name': 'arpit',
//       },
//       {
//         'id': 4,
//         'name': 'rahul',
//       },
//       {
//         'id': 5,
//         'name': 'pushpendra',
//       }
//     ];
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Demo",
//             style: TextStyle(color: Colors.white),
//           ),
//           automaticallyImplyLeading: false,
//         ),
//         body: ListView.separated(
//           itemCount: names.length,
//           separatorBuilder: (context, index) {
//             return Divider(height: 12);
//           },
//           itemBuilder: (context, index) {
//             final todo = names[index];
//             print('index $todo');
//             return Text(
//               '${todo['id']} index ${index} name : ${todo['name']}',
//               style: TextStyle(color: Colors.black, fontSize: 18),
//             );
//           },
//         ));
//     // SingleChildScrollView(
//     //   // scrollDirection: Axis.vertical,
//     //   child: Center(
//     //       child: Column(
//     //     children: [
//     //       MyWidget(data: "Deepak"),
//     //       MyWidget(data: "dhakad"),
//     //       MyWidget(data: "dhanora"),
//     //       MyWidget(data: "Bani"),
//     //     ],
//     //   )),
//     // ));
//   }
// }

// Widget MyWidget({required data}) {
//   return Container(
//     height: 200,
//     // width: 200,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey, width: 3.0),
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//     ),
//     // color: Colors.green,
//     child: Center(
//       child: Text(
//         "Hello World! $data",
//         style: TextStyle(
//             color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
