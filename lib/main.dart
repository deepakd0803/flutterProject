import 'package:flutter/material.dart';
import 'package:flutter_app/apidatafatch.dart';
import 'package:flutter_app/apiprovider.dart';
import 'package:flutter_app/authentication_service.dart';
// import 'package:flutter_app/demo.dart';
import 'package:flutter_app/splash_screen.dart';
// import 'package:flutter_app/todo_provider.dart';
import 'package:provider/provider.dart';

// Provider is a widget that provides a value or a service to its descendants.
void main() {
  runApp(
    // Multiprovider is a widget that provides a multiple provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ChangeNotifierProvider(
          create: (_) => Apiprovider(),
        ),
        // ChangeNotifierProvider(create: (_) => TodoProvider()),
        // ChangeNotifierProvider(create: (_) => HomeScreen()),
      ],
      child: MainApp(),
    ),
  );
}

// this widget is immutable no state , no rebuild on change
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLutter Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          iconTheme: IconThemeData(color: Colors.white)),
      home: const FavoriteWidget(),
    );
  }
}

// this widget is mutable, state rebuild on change
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Apidatafatch(),
    );
  }
}




// Day 8 Task 
//       body: Center(
//         child: SafeArea(
//           top: true,
//           child: Column(
//             children: [
//               Container(
//                 width: 360,
//                 height: 80,
//                 margin: const EdgeInsets.only(top: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.blue, // Customize background color
//                   // borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // spacing: 122,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(12),
//                       child: IconButton(
//                         onPressed: () {
//                           print("pressed back");
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: Colors.black,
//                         ),
//                         style:
//                             IconButton.styleFrom(backgroundColor: Colors.white),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(12),
//                       child: IconButton(
//                         onPressed: () {
//                           print("pressed bookmark");
//                         },
//                         icon: const Icon(
//                           Icons.bookmark,
//                           color: Colors.black,
//                         ),
//                         style:
//                             IconButton.styleFrom(backgroundColor: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 360,
//                 height: 120,
//                 // margin: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.blue, // Customize background color
//                   // borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Icon(
//                   size: 80,
//                   color: Colors.white,
//                   Icons.image_not_supported,
//                 ),
//               ),
//               Container(
//                 width: 360,
//                 height: double.infinity,
//                 // margin: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white, // Customize background color
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                 ),
//                 child: Column(
//                   // spacing: 12,
//                   children: [
//                     Container(
//                       width: 360,
//                       // height: 120,
//                       margin: const EdgeInsets.all(12),
//                       child: Text(
//                         "Black Windows",
//                         style: TextStyle(
//                             fontSize: 21,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Icon(
//                             size: 25,
//                             color: Colors.yellow,
//                             Icons.star_rate,
//                           ),
//                         ),
//                         SizedBox(
//                           child: Text("8.5 | Action , Adventure , Drama"),
//                         )
//                       ],
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(12),
//                       child: Text(
//                           "Lorem Ipsum is  and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
//                     ),
//                     const Divider(
//                       color: Colors.grey,
//                       height: 15,
//                       thickness: 2,
//                       indent: 4,
//                       endIndent: 4,
//                     ),
//                     Container(
//                       width: 360,
//                       // height: 120,
//                       // margin: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.symmetric(horizontal: 8),

//                       child: Text(
//                         "Information",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Container(
//                       // margin: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text(
//                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
//                     ),
//                     Container(
//                       width: 360,
//                       // height: 120,
//                       // margin: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.symmetric(horizontal: 8),

//                       child: Text(
//                         "Cast",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       Colors.blue, // Customize background color
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))
//                                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                   ),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       Colors.blue, // Customize background color
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))
//                                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                   ),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       Colors.blue, // Customize background color
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))
//                                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                   ),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       Colors.blue, // Customize background color
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))
//                                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                   ),
//                             )),
//                         Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       Colors.blue, // Customize background color
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12))
//                                   // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                   ),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                         child: TextButton(
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.blue,
//                           backgroundColor: Colors.blue,
//                           textStyle: const TextStyle(fontSize: 14),
//                           padding: EdgeInsets.symmetric(horizontal: 100)),
//                       onPressed: () {
// // Define the action to be performed when the button is pressed
//                       },
//                       child: const Text(
//                         'Simple Button',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )),
//                     // GestureDetector(
//                     //   child: Text("data"),
//                     //   on

//                     // )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   spacing: 20,
      //   children: <Widget>[
      //     SizedBox(
      //         height: 40,
      //         child: Container(
      //           width: 320,
      //           height: 40,
      //           decoration: BoxDecoration(
      //             color: Colors.orange, // Customize background color
      //             borderRadius: BorderRadius.circular(30),
      //           ),
      //           // color: Colors.blue,
      //           child: Center(
      //             child: Text(
      //               'ICONS',
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         )),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         color: Colors.yellow, // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // spacing: 122,

      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Icon(
      //               size: 30,
      //               color: Colors.purpleAccent,
      //               Icons.favorite,
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Text(
      //               "Profile",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         color: const Color.fromRGBO(
      //             255, 152, 0, 1), // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // spacing: 122,

      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Text(
      //               "Music",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Icon(
      //               size: 30,
      //               color: const Color.fromARGB(255, 38, 140, 107),
      //               Icons.audiotrack,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         color: Colors.orange, // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // spacing: 122,

      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Icon(
      //               size: 30,
      //               color: Colors.blue,
      //               Icons.add,
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Text(
      //               "Share",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 40,
      //       child: Container(
      //         width: 320,
      //         height: 40,
      //         decoration: BoxDecoration(
      //           color: const Color.fromARGB(
      //               255, 255, 0, 187), // Customize background color
      //           borderRadius: BorderRadius.circular(30),
      //         ),
      //         // color: Colors.blue,
      //         child: Center(
      //           child: Icon(
      //             size: 30,
      //             color: Colors.blue,
      //             Icons.favorite,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         // color: Colors.orange, // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             // margin: const EdgeInsets.symmetric(horizontal: 15),
      //             width: 130,
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: const Color.fromARGB(
      //                   255, 255, 102, 0), // Customize background color
      //               borderRadius: BorderRadius.circular(30),
      //             ),
      //             child: Icon(
      //               size: 30,
      //               color: Colors.blue,
      //               Icons.favorite,
      //             ),
      //           ),
      //           Container(
      //               width: 130,
      //               height: 40,
      //               // margin: const EdgeInsets.symmetric(horizontal: 15),
      //               decoration: BoxDecoration(
      //                 color: Colors.orange, // Customize background color
      //                 borderRadius: BorderRadius.circular(30),
      //               ),
      //               child: Center(
      //                 child: Icon(
      //                   size: 30,
      //                   color: Colors.blue,
      //                   Icons.favorite,
      //                 ),
      //               )),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         color: Colors.orange, // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // crossAxisAlignment: CrossAxisAlignment.end,
      //         // spacing: 122,

      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Icon(
      //               size: 30,
      //               color: Colors.blue,
      //               Icons.favorite,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: 320,
      //       height: 40,
      //       margin: const EdgeInsets.symmetric(horizontal: 12),
      //       decoration: BoxDecoration(
      //         color: Colors.orange, // Customize background color
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         // crossAxisAlignment: CrossAxisAlignment.end,
      //         // spacing: 122,

      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Icon(
      //               size: 30,
      //               color: Colors.blue,
      //               Icons.favorite,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
    //   ),
    // )

        //  Text("data"),
        // TextButton(
        //   child: Text('data'),
        //   onPressed: () {
        //     print('Text button tap');
        //   },
        //   onLongPress: () => print("long press"),
        // ),
        // body: Center(
        //     child: Container(
        //         width: 300,
        //         height: 300,
        //         color: Colors.blue,
        //         child: Center(
        //           child: Text(
        //             'hello',
        //             style: TextStyle(
        //                 fontSize: 25,
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //
        //       ))));
//         );
//   }
//   // ···
// }



// Widget _buildIconContainer(IconData icon) {
//   return Container(
//     width: 320,
//     height: 60,
//     decoration: BoxDecoration(
//       color: Colors.grey[200], // Customize background color
//       borderRadius: BorderRadius.circular(40),
//     ),
//     child: Icon(
//       icon,
//       size: 30,
//       color: Colors.blue, // Customize icon color
//     ),
//   );
// }
