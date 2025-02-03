import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  // var _nameError, _emailError, _passwordError;
  @override
  Widget build(BuildContext context) {
    // final authenticationService = Provider.of<AuthenticationService>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Center(
              child: Column(
            spacing: 12,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.token_rounded,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 3,
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
                  controller: _nameController,
                  onChanged: (value) =>
                      context.read<AuthenticationService>().validateName(value),
                  decoration: InputDecoration(
                      errorText: context
                              .watch<AuthenticationService>()
                              .nameError
                              .isNotEmpty
                          ? context.watch<AuthenticationService>().nameError
                          : null,
                      labelText: "Name",
                      border: InputBorder.none),
                  keyboardType: TextInputType.emailAddress,
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
                      errorText: context
                              .watch<AuthenticationService>()
                              .emailError
                              .isNotEmpty
                          ? context.watch<AuthenticationService>().emailError
                          : null,
                      labelText: "Email",
                      border: InputBorder.none),
                  keyboardType: TextInputType.emailAddress,
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
                ),
              ),
              // confirm password field;
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey,
              //           blurRadius: 12,
              //         )
              //       ]),
              //   child: TextField(
              //     decoration: InputDecoration(
              //         labelText: "Confirm Password", border: InputBorder.none),
              //     keyboardType: TextInputType.visiblePassword,
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  if (context.read<AuthenticationService>().validateEmail(
                            _emailController.text,
                          ) &&
                      context.read<AuthenticationService>().validatePassword(
                            _passwordController.text,
                          ) &&
                      context.read<AuthenticationService>().validateName(
                            _nameController.text,
                          )) {
                    context.read<AuthenticationService>().signUp(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
                  textStyle:
                      TextStyle(color: const Color.fromARGB(255, 191, 32, 32)),
                  minimumSize: Size(320, 50),
                ),
              ),

              SizedBox(
                child: Text(
                  "- Or sign up with -",
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
      size: 20,
      color: Colors.blue,
      icon,
    ),
  );
}
