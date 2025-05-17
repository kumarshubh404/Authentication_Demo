import 'dart:ui';
import 'package:authentication_demo/View/Login_Screen/OtpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/Home_Screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _welcomScreen();

}
class _welcomScreen extends State<WelcomeScreen> {

  var textFieldController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: IconButton(
                    icon: Image.asset('assets/images/Close.png'),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    // adjust size as needed
                    splashRadius: 16, // optional
                  ),
                ),
                const SizedBox(width: 20,),
              ],),
            const SizedBox(height: 12,),
            Image.asset('assets/images/logo.png', height: 80, width: 150,),
            const SizedBox(height: 44,),
            const Text('Welcome Back!',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),),
            const SizedBox(height: 10,),
              const Text('Login to continue',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
              ),),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 37),
              child: TextFormField(
                controller: textFieldController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    labelText: 'Phone Number',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey.shade400,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: const BorderRadius.all(Radius.circular(12)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Otpscreen()));
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text/icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                  child: const Text('GET OTP', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.white,
                    ),
                 ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 92, bottom: 44),
              child: Text('Or Continue With',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 57,
                      width: 100,
                      decoration: decoration
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox (
                            height: 24,
                            width: 24,
                            child: Image.asset(
                              'assets/images/Google.png',
                            //  fit: BoxFit.cover,
                            )),

                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text('Google', style: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.normal), ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 16,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 57,
                        width: 100,
                        decoration: decoration
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox (
                            height: 24,
                            width: 24,
                            child: Image.asset(
                              'assets/images/Facebook.png',
                              //  fit: BoxFit.cover,
                            )),

                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text('Facebook', style: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.normal), ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don’t have an account?',style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  fontFamily: "Poppins",
                ),),
                TextButton(
                  onPressed: (){},
                  child: const Text('SIGN UP', style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}