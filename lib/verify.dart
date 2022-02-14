import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/home.dart';
class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth=FirebaseAuth.instance;
  User? user;
  late Timer timer;
  @override
  void initState() {
    user=auth.currentUser;
    user?.sendEmailVerification();
    
   timer= Timer.periodic(Duration(seconds: 5), (timer) {
     checkEmailVerified();

    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'An emailhas been sent to ${user?.email} please verify'
        ),
      ),
    );
  }
  Future<void> checkEmailVerified()async{
    user=auth.currentUser;
    await user?.reload();
    if(user!.emailVerified){
      timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>home() ));

    }
  }
}