import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _emailError, _passwordError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign In",
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Center(
              child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Icon(
                  Icons.token_rounded,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Create your Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12,
                      )
                    ]),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: InputBorder.none,
                      errorText: _emailError),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  // onChanged: (text) => print("on change $text"),
                  // onSubmitted: (value) => print("final value is $value"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12,
                      )
                    ]),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      errorText: _passwordError,
                      labelText: "Password",
                      border: InputBorder.none),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  // onChanged: (text) => print("on change $text"),
                  // onSubmitted: (value) => print("final value is $value"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthenticationService>().login(
                          _emailController.text,
                          _passwordController.text,
                        );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  backgroundColor: Colors.blue,
                  textStyle:
                      TextStyle(color: const Color.fromARGB(255, 191, 32, 32)),
                  minimumSize: Size(320, 50),
                ),
              ),
              SizedBox(
                child: Text(
                  "- Or sign in with -",
                  style: TextStyle(color: const Color.fromARGB(155, 0, 0, 0)),
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(child: MyWidget(icon: FontAwesomeIcons.google)),
                    SizedBox(child: MyWidget(icon: FontAwesomeIcons.facebook)),
                    SizedBox(child: MyWidget(icon: FontAwesomeIcons.twitter)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text("Don't have any Account ?"),
                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            )),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          )),
        )));
  }
}

Widget MyWidget({required IconData icon}) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12,
          )
        ]),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    child: Icon(
      size: 24,
      icon,
      color: Colors.blue,
    ),
  );
}
