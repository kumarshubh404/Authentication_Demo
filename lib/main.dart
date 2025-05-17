import 'package:flutter/material.dart';
import 'View/Home/Home_Screen.dart';
import 'View/Login_Screen/CreateAccountScreen.dart';
import 'View/Login_Screen/OtpScreen.dart';
import 'View/Login_Screen/Welcome_Screen.dart';
import 'View/Splash_Screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen(),
    );
  }
}
