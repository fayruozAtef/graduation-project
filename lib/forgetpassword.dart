import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/backWithOpacity.dart';

import 'authscreen.dart';
enum AuthMode{ Signup , Login }

class Password extends StatelessWidget {
  static const routeName='/auth';
  //const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: const Text("Reset Password",style: TextStyle(color: Colors.white,fontSize:22)),
        backgroundColor: Colors.black,),
      //padding: EdgeInsets.all(20.0),
      body: Stack(
        children:<Widget> [
          const BackWithOpacity(),
          Image.asset('assets/images/logo.png' , height: 80,width: 80,
            alignment: Alignment.topLeft,
          ),
          const SizedBox(height: 200,),
          Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: const <Widget>[
                ForgetPAssword(),
              ],
            ),
          ),
        ],
      ),
    );


  }
}


class ForgetPAssword extends StatefulWidget {
  const ForgetPAssword({
    Key ? key,
  }) : super(key: key);

  @override
  _ForgetPAsswordState createState() => _ForgetPAsswordState();
}

class _ForgetPAsswordState extends State<ForgetPAssword> {
  final GlobalKey<FormState>_formKey=GlobalKey();
  final emailcontroller=TextEditingController();
  CollectionReference gettype = FirebaseFirestore.instance.collection("employee");
  String type="";
  Map<String, String> _autData={
    'email':'' ,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
          children:[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 80.0,),

                      ////////////////////////////////////////////
                      TextFormField(
                        decoration:const InputDecoration (
                          labelText: 'E-Mail' ,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        validator: (value){
                          _autData['email']=value!;
                          if(value!.isEmpty || !value.contains('@')){
                            return 'Invalid Email! ';
                          }
                        },
                         controller: emailcontroller,
                        onSaved: (value){
                          _autData['email']=value!;
                        },
                      ),

                      const SizedBox(height: 20,),

                        RaisedButton(
                          child:
                          const Text('Reset Password',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed:() {
                          resetpassword();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 8.0),
                          color: Color.fromRGBO(65, 189, 180, 54),
                          textColor: Colors.white,
                        ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          ]

      );

  }
  Future resetpassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailcontroller.text.trim()).then((value) =>{
          showAlertDialog(context, "Password Reset Email Sent"),
          Timer(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AuthScreen()));
          }),
      });
    }on FirebaseException catch(e){
      print(e);
    }
  }
  showAlertDialog(BuildContext context,String message) {

    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(
      backgroundColor: Colors.white54,
      title:const Text("Message:", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,
      ),),
      content: Text('$message', style: const TextStyle(
        fontSize: 18, color: Colors.black,
      ),),
      actions: [],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


