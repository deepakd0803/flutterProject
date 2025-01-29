import 'package:flutter/material.dart';
import 'package:flutter_app/user_modal.dart';

class AuthenticationService with ChangeNotifier {
  User _user = User();
// changeNotifier helps you manage state change in app
  User get user => _user;

  void login(String email, String password) {
 
    if (email == 'deepak@123gmail.com' && password == '12345678') {
      _user = User(email: email, password: password);
      notifyListeners();
      // when notifylisteners it will rebuild all the widgets 
    } else {
      print('Invalid email and Password');
    }
  }

  void signUp(String name, String email, String password) {
  
    _user = User(name: name, email: email, password: password);
    notifyListeners();
  }
}
