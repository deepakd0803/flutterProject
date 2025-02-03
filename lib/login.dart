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
  // var _emailError, _passwordError;
  @override
  Widget build(BuildContext context) {
    // final authenticationService = Provider.of<AuthenticationService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign In",
            style: TextStyle(color: Colors.white),
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
                margin: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.token_rounded,
                  color: Colors.blue,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Create your Account",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
                  onChanged: (value) => context
                      .read<AuthenticationService>()
                      .validateEmail(value),
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: InputBorder.none,
                      errorText: context
                              .watch<AuthenticationService>()
                              .emailError
                              .isNotEmpty
                          ? context.watch<AuthenticationService>().emailError
                          : null),

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
                  onChanged: (value) => context
                      .read<AuthenticationService>()
                      .validatePassword(value),
                  decoration: InputDecoration(
                      errorText: context
                              .watch<AuthenticationService>()
                              .passwordError
                              .isNotEmpty
                          ? context.watch<AuthenticationService>().passwordError
                          : null,
                      labelText: "Password",
                      border: InputBorder.none),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  // onChanged: (text) => print("on change $text"),
                  // onSubmitted: (value) => print("final value is $value"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () {
                    if (context.read<AuthenticationService>().validateEmail(
                              _emailController.text,
                            ) &&
                        context.read<AuthenticationService>().validatePassword(
                              _passwordController.text,
                            )) {
                      context.read<AuthenticationService>().login(
                            _emailController.text,
                            _passwordController.text,
                          );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                    // } else {
                    //   // Show error messages
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text(context
                    //               .read<AuthenticationService>()
                    //               .emailError
                    //               .isNotEmpty
                    //           ? context.read<AuthenticationService>().emailError
                    //           : context
                    //               .read<AuthenticationService>()
                    //               .passwordError),
                    //     ),
                    //   );
                    // }
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
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 191, 32, 32)),
                    minimumSize: Size(320, 50),
                  ),
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
                      child: Text(
                        "Don't have any Account ?",
                        style: TextStyle(color: Colors.black),
                      ),
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
