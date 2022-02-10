import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/auth.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


enum AuthMode{ Signup , Login }

class AuthScreen extends StatelessWidget {
  static const routeName='/auth';
  //const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20.0),
      child:  Stack(
        children:<Widget> [
          Back(),
          Image.asset('assets/images/logo.png' , height: 80,width: 80,
            alignment: Alignment.topLeft,
          ),
          const SizedBox(height: 200,),
          Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: const <Widget>[
                AuthCard(),
              ],
            ),
          ),
        ],
      ),
    );


  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key ? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState>_formKey=GlobalKey();
  AuthMode _authMode=AuthMode.Login;
  Map<String, String> _autData={
    'email':'' ,
    'password':'' ,
    'fname':'',
    'lname':'',
    'phone':'',
  };
  var _isLoading=false;
  final _passwordController =TextEditingController();

  Future<void> _submit() async{
    if(_formKey.currentState!.validate()){

    _formKey.currentState!.save() ;
    //true signup
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _autData['email']!,
          password: _autData['password']!
      );
      print(_autData['email']);
      print(_autData['password']);
      //

      /*CollectionReference users = FirebaseFirestore.instance.collection('users').doc();

        // Call the user's CollectionReference to add a new user
       users
            .add()
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));*/

      Auth auth  = Auth();
      auth.saveData({
        'first name': _autData['fname'], // John Doe
        'last name': _autData['lname'], // Stokes and Sons
        'phone': _autData['phone'] ,
        'email':_autData['email']
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading=true;
    });
    if(_authMode==AuthMode.Login){
      //Lod User in
    }
    else {
      // Sign user up

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _autData['email']!,
            password: _autData['password']!
        );
        print(_autData['email']);
        print(_autData['password']);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      _isLoading=false;
    });
    }
  }
  void _switchAuthMode(){
    if(_authMode==AuthMode.Login){
      setState(() {
        _authMode= AuthMode.Signup;
      });
    }else{
      setState(() {
        _authMode=AuthMode.Login;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Stack(
        children:[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50.0,),
                    const Text('Welcome', style: TextStyle(color: Colors.white,fontSize: 30,fontFamily:'Time New Roman'),textAlign:TextAlign.center),
                    const SizedBox(height: 50,),
                    if(_authMode==AuthMode.Signup)
                      TextFormField(
                        enabled: _authMode==AuthMode.Signup,
                        decoration: InputDecoration(labelText: 'F-name' ,labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        validator: (value){
                          _autData['firstname']=value!;
                        },
                        onSaved: (value) {
                          _autData['fname']=value!;
                        },
                      ),
                    if(_authMode==AuthMode.Signup)
                      TextFormField(
                        enabled: _authMode==AuthMode.Signup,
                        decoration:const InputDecoration(labelText: 'L-name' ,labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        validator: (value){
                          _autData['lastname']=value!;
                        },
                        onSaved: (value) {
                          _autData['lname']=value!;
                        },
                      ),
                    if(_authMode==AuthMode.Signup)
                      TextFormField(
                        enabled: _authMode==AuthMode.Signup,
                        decoration:const InputDecoration(labelText: 'phone' ,labelStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.white),
                        validator: (value){
                          _autData['phone']=value!;
                        },
                        onSaved: (value) {
                          _autData['phone']=value!;
                        },
                      ),
                    ////////////////////////////////////////////
                    TextFormField(
                      decoration:const InputDecoration (labelText: 'E-Mail' ,labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Invalid Email! ';
                        }
                      },
                      onSaved: (value){
                        _autData['email']=value!;
                      },
                    ),
                    TextFormField(
                      decoration:const InputDecoration(labelText: 'password' ,labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'enter password';
                        }
                        else if(value.length <5){
                          return 'password is too short!';
                        }
                      },
                      onSaved: (value) {
                        _autData['password']=value!;
                      },
                    ),
                    if(_authMode==AuthMode.Signup)
                      TextFormField(
                        enabled: _authMode==AuthMode.Signup,
                        decoration:const InputDecoration(labelText: 'confirm password' ,
                            labelStyle: TextStyle(color: Colors.white,fontSize: 18)),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: _authMode==AuthMode.Signup
                            ? (value) {
                          if(value !=_passwordController.text){
                            return 'passwords do not match!' ;
                          }
                        }
                            :null,
                      ),

                    const SizedBox(height: 20,),
                    if(_isLoading)
                      CircularProgressIndicator()
                    else
                      RaisedButton(
                        child:
                        Text(_authMode==AuthMode.Login? 'LOGIN':'SIGN UP',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: _submit,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 8.0),
                        color: Color.fromRGBO(65, 189, 180, 54),
                        textColor: Colors.white,
                      ),
                    const SizedBox(height: 10,),
                    FlatButton(
                      child: Text(
                          '${_authMode==AuthMode.Login ? 'SIGNUP' : 'LOGIN'} ',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: _switchAuthMode ,
                      //padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]

    );
  }
}


