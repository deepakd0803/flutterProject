import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apiprovider extends ChangeNotifier {
  List _data = [];
  List getData() => _data;

// void incrementCount(int val) {
//     print("val in increasing $val");
//     _counter = _counter + val;
//     notifyListeners();
//   }
  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _data = json.decode(response.body);
      notifyListeners();
      print("data ${_data}");
    } else {
      throw Exception("Faild to load api call");
    }
  }

  void DeleteData(int index) {
    print("index $index");
    _data.removeAt(index);
    notifyListeners();
  }
}
