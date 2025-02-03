import 'package:flutter/material.dart';
import 'package:flutter_app/user_modal.dart';

class AuthenticationService with ChangeNotifier {
  User _user = User();
  String _emailError = '';
  String _passwordError = '';
  String _nameError = '';

  User get user => _user;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get nameError => _nameError;

  bool validateEmail(String email) {
    if (email.isEmpty) {
      _emailError = 'Email is required';
      notifyListeners();
      return false;
    } else if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email)) {
      _emailError = 'Invalid email format';
      notifyListeners();
      return false;
    } else {
      _emailError = '';
      notifyListeners();
      return true;
    }
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      _passwordError = 'Password is required';
      notifyListeners();
      return false;
    } else if (password.length < 8) {
      _passwordError = 'Password must be at least 8 characters';
      notifyListeners();
      return false;
    } else {
      _passwordError = '';
      notifyListeners();
      return true;
    }
  }

  bool validateName(String name) {
    if (name.isEmpty) {
      _nameError = 'Name is required';
      notifyListeners();
      return false;
    } else {
      _nameError = '';
      notifyListeners();
      return true;
    }
  }

  void login(String email, String password) {
    if (email == "deepak@123gmail.com" && password == "12345678") {
      // Login logic here
      _user = User(email: email, password: password);
      notifyListeners();
    }
  }

  void signUp(String name, String email, String password) {
    // Signup logic here
    _user = User(name: name, email: email, password: password);
    notifyListeners();
  }
}
