import 'package:flutter/material.dart';
import 'package:resflutter_app/loginpage.dart';
import 'package:resflutter_app/register.dart';
import 'register.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home:Loginpage(),
      routes: {
        '/login':(context)=>Loginpage(),
        '/register':(context)=>Register()
      },
    );
  }
}


