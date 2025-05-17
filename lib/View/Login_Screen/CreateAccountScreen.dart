import 'package:flutter/material.dart';

import '../Home/Home_Screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
  Map userData = {};
  var conPass = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  BoxDecoration decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 1.5,
        blurRadius: 2,
      ),
    ],
  );

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 77.0),
                  child: Container(
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        fontSize: 10),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 74.0, left: 30, right: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Special Characters',
                            prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility_off, color: Colors.grey,
                                // _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)))),
                      ),

                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Repeat Password',
                            prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility_off, color: Colors.grey,
                                // _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)))),
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 60),
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Or Continue With',
                        style: TextStyle(fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 57, width: 100, decoration: decoration),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    'assets/images/apple.png',
                                    //  fit: BoxFit.cover,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text(
                                  'Apple',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 57, width: 100, decoration: decoration),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    'assets/images/Google.png',
                                    //  fit: BoxFit.cover,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text(
                                  'Google',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 57, width: 100, decoration: decoration),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    'assets/images/Facebook.png',
                                    //  fit: BoxFit.cover,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
