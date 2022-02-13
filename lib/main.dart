import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:resflutter_app/auth.dart';
import 'package:resflutter_app/categories.dart';
import 'package:resflutter_app/authscreen.dart';
import 'package:provider/provider.dart';
import 'authscreen.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home:AuthScreen(),

    );
  }
}

