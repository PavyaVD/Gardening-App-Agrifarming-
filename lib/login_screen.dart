import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:learnapp/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'dart:html';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email, _password;

  void signIn() async{
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password).catchError(onError){
          print(onError);
        }
       // )
       .then((authUser){
        print(authUser.user.uid);

        //sJ7M62PdAgYxSmEyTQ6n2QJg6sW2  //uid
       });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //print(width);
    //print(height);

    var textFormField = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.green,
        ),
        labelText: "Password",
        labelStyle:
            TextStyle(color: Color.fromARGB(255, 27, 146, 27), fontSize: 14),
      ),
    );
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        bgImage,
                        height: height * 0.40,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 0.50,
                        width: width,
                        //color: Colors.green.withOpacity(0.3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.3, 0.7],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white])),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      appName,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Center(
                    child: Text(
                      slogan,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      child: Text(
                        " $loginString  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.transparent],
                          ),
                          border: Border(
                            left: BorderSide(color: Colors.green, width: 5),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (email) {
                        if (email != null && email.isEmpty) {
                          return "Please Enter Email";
                        } else {
                          print(email);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 27, 146, 27),
                              fontSize: 16)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: (password) {
                        if (password != null && password.isEmpty) {
                          return "Please Enter Password";
                        } else {
                          print(password);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 27, 146, 27),
                              fontSize: 16)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: textFormField,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(forgotText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                    ),
                  ),
                  Center(
                    child: Container(
                        height: height * 0.08,
                        width: width - 30,
                        color: Colors.green,
                        child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState.save();
                                signIn();
                              /*  if (_email == "Test@gmail.com" &&
                                    _password == "123") {
                                  FocusScope.of(context).unfocus();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                } else {
                                  print("invalid login details");
                                }
                                // print("_email");
                                //  print("_password"); */
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ))),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black)),
                    TextButton(
                      onPressed: () {},
                      child: Text("Create Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green)),
                    ),
                  ]),
                ]),
          ),
        ),
      ),
    );
  }
}
