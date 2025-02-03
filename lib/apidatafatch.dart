import 'package:flutter/material.dart';
import 'package:flutter_app/apiprovider.dart';
// import 'package:flutter_application_1/apiprovider.dart';
import 'package:provider/provider.dart';

class Apidatafatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fatch Data"),
      ),
      body: Center(
          child: Column(children: [
        IconButton(
            onPressed: () {
              context.read<Apiprovider>().fetchData();
            },
            icon: Icon(Icons.add)),

        Consumer<Apiprovider>(builder: (ctx, provider, __) {
          final apiData = ctx.watch<Apiprovider>().getData();
          print("api ${apiData.length}");
          return Expanded(child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Id: ${apiData[index]['id']}'),
              subtitle: Text('title : ${apiData[index]['title']}'),
              trailing: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            print("click ${index}");
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            ctx.read<Apiprovider>().DeleteData(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  )),
            );
          }));
        })

        // Expanded(child:
        //     ListView.builder(
        //       itemBuilder: (BuildContext context, int index) {
        //   return
        //   Consumer<Apiprovider>(builder: (ctx, provider, __) {
        //     final mainData = ctx.watch<Apiprovider>().getData();
        //     print("mainData ${mainData.length}");
        //     return ListTile(
        //       title: Text('data: ${mainData}'),
        //     );
        //   });
        // }))
      ])),
    );
  }
}
