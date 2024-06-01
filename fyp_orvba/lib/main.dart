import 'package:flutter/material.dart';
import 'package:fyp_orvba/User%20Screens/requestAssistance.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp_orvba/welcome_screen.dart';


final FirebaseDatabase database = FirebaseDatabase.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD4LFWMPsNO0CjrJCXn8iOiGTghqUuB4rE",
      authDomain: "your_auth_domain",
      projectId: "fyp-project-7aaa0",
      storageBucket: "fyp-project-7aaa0.appspot.com",
      messagingSenderId: "1095658387183",
      appId: "1:1095658387183:android:d51ffd00edd98bf93f0d1a",
      databaseURL: "https://fyp-project-7aaa0-default-rtdb.firebaseio.com/",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => WelcomeScreen(),
        '/login':(context) => userLogin()
      },
    );
  }
}

