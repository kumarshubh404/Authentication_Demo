import 'package:flutter/material.dart';
import '../../ViewModel/GoogleSignInProvider.dart';
import '../Home/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {

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

  // Sign Up
  Future<void> _register() async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: pass.text.trim(),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

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
                        validator: (value) =>
                        value != null && value.contains('@') ? null : 'Enter a valid email',
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: pass,
                        validator: (value) =>
                        value != null && value.length >= 6 ? null : 'Minimum 6 characters',
                        decoration: InputDecoration(
                            labelText: 'Special Characters',
                            prefixIcon: const Icon(Icons.lock, color: Colors.grey,),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.visibility_off, color: Colors.grey,
                                // _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {},
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)))),
                      ),

                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: conPass,
                        validator: (value) =>
                        value != null && value.length >= 6 ? null : 'Minimum 6 characters',
                        decoration: InputDecoration(
                            labelText: 'Repeat Password',
                            prefixIcon: const Icon(Icons.lock, color: Colors.grey,),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.visibility_off, color: Colors.grey,
                                // _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {},
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)))),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 60),
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: _register,
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
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
                      TextButton(onPressed: () async {
                        final provider = GoogleSignInProvider();
                        final userCredential = await provider.signInWithGoogle();
                        if (userCredential != null) {
                          print('Signed in: ${userCredential.user?.displayName}');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        } else {
                          print('Google sign-in canceled or failed.');
                        }
                      }, child:  Stack(
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
                      ),),
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
