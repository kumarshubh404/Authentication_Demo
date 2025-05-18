import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/Splash_Screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Web requires FirebaseOptions
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB_Ih-WTx548Rui1JQS3HNUdLDDyCBse1A",
        authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
        projectId: "authentication-demo-b3ce8",
        storageBucket: "YOUR_PROJECT_ID.appspot.com",
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
        appId: "com.myapp.authentication_demo",
      ),
    );
  } else {
    // Android & iOS use config files
    await Firebase.initializeApp();
  }

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
      home: const Splashscreen(),
    );
  }
}
