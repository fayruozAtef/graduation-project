import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/auth.dart';
import 'package:resflutter_app/widgets/home.dart';
import 'package:resflutter_app/widgets/widgets.dart';

import 'forgetpassword.dart';

enum AuthMode{ Signup , Login }

class AuthScreen extends StatelessWidget {
  static const routeName='/auth';
  //const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.all(20.0),
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
  TextEditingController email = TextEditingController();
  final _passwordController =TextEditingController();
  Map<String, String> _autData={
    'email':'' ,
    'password':'' ,
    'fname':'',
    'lname':'',
    'phone':'',

  };
  var _isLoading=false;


  ///////sign up function/////////

  Future<void>_signup()async{

    if(_formKey.currentState!.validate()){

      _formKey.currentState!.save() ;
      //true signup
        //to make user authentication
        UserCredential userCredential ;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _autData['email']!,
            password: _autData['password']!
        ).then((value){
          Auth auth  = Auth();
          auth.saveData({
            'first name': _autData['fname'], // John Doe
            'last name': _autData['lname'], // Stokes and Sons
            'phone': _autData['phone'] ,
            'email':_autData['email'],
            'coins':100,
            'gender':_autData['Gender']
          }

          ).then((value) {
            _switchAuthMode();
          }).then((value) {
            email.text.trim();
            _passwordController.text.trim();
          });

        }).catchError((e){
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            showAlertDialog(context, 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');

            showAlertDialog(context, 'The account already exists for that email.');


          }
        });
    }

  }

  /////////log in function//////////////////
  Future<void>_logIn()async{
    if(_formKey.currentState!.validate()){

      _formKey.currentState!.save() ;
      //true login
      UserCredential userCredential ;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _autData['email']!,
          password: _autData['password']!
      ).then((value){
        print("Successfull");
        String id=Auth().getId();

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>home(userId: id,))
        ).then((value)
        {
          email.clear();
        _passwordController.clear();
        });
       // print(value.user.uid);
      }).catchError((e){
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          showAlertDialog(context, 'No user found for that email.');
        } else if (e.code == 'wrong-password')
        {
          print('Wrong password provided for that user.');
          showAlertDialog(context, 'Wrong password');
        }
      });
    }
  }


  void _switchAuthMode(){
    if(_authMode==AuthMode.Login){
      setState(() {
        _authMode= AuthMode.Signup;
        email.text.trim();
        _passwordController.text.trim();
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
                          if(value.length>11 || value.length<11)
                          {
                            return 'Please enter a valid phone number ';
                          }
                        },
                        onSaved: (value) {
                          _autData['phone']=value!;
                        },
                      ),
                    ////////////////////////////////////////////
                    TextFormField(
                      controller: email,
                      decoration:const InputDecoration (
                          labelText: 'E-Mail' ,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
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
                    if(_authMode==AuthMode.Signup)
                    Container(
                      padding:EdgeInsets.all(2),
                      child:Row(
                          children:[
                            Text('Gender : ',style:TextStyle(color:Colors.white,fontSize: 17,)),
                            Radio<String>(value: 'male',
                              groupValue: _autData['Gender'],
                              onChanged: (value) {
                                setState((){
                                  _autData['Gender']=value!;
                                });
                              },
                            ),
                            Text('Male',style:TextStyle(color:Colors.white,fontSize: 20)),
                            Radio<String>(value: 'female',
                              groupValue:  _autData['Gender'],
                              onChanged: (value) {
                                setState((){
                                  _autData['Gender']=value!;
                                });
                              },
                            ),
                            Text('Female',style:TextStyle(color:Colors.white,fontSize: 20))
                          ]
                      ),
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
                        onPressed:() {
                          if(_authMode==AuthMode.Login)
                            {
                              //_logIn(email.toString(),_passwordController.toString());
                              _logIn();

                            }
                          else if(_authMode==AuthMode.Signup)
                            {
                              _signup();
                            }
                        },
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
                    const SizedBox(height: 10,),
                    if(_authMode==AuthMode.Login)
                    FlatButton(
                      child: Text(
                        'Forget Password ',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Password()));
                      } ,
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
  showAlertDialog(BuildContext context,String message) {

    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(
      backgroundColor: Colors.white54,
      title:const Text("Warning:", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
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


