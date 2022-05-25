import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/auth.dart';
import 'package:resflutter_app/registerpage.dart';
import 'package:resflutter_app/widgets/home.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'forgetpassword.dart';

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
  TextEditingController email = TextEditingController();
  final _passwordController =TextEditingController();
  Map<String, String> _autData={
    'email':'' ,
    'password':'' ,
  };
  var _isLoading=false;


  ///////sign up function/////////

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
                    TextFormField(
                      controller: email,
                      decoration:const InputDecoration (
                          labelText: 'E-Mail' ,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      validator: (value){
                        if(value!.isEmpty ){
                          return 'enter your emil please!';
                        }
                      },
                      onSaved: (value){
                        _autData['email']=value!;
                      },
                    ),
                    TextFormField(
                      decoration:const InputDecoration(
                          labelText: 'password' ,
                          labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'enter your password please!';
                        }
                      },
                      onSaved: (value) {
                        _autData['password']=value!;
                      },
                    ),
                    const SizedBox(height: 20,),
                    if(_isLoading)
                      CircularProgressIndicator()
                    else
                      RaisedButton(
                        child:
                        Text( 'LOGIN',
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed:() {
                          //_logIn(email.toString(),_passwordController.toString());
                              _logIn();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 8.0),
                        color: Color.fromRGBO(65, 189, 180, 54),
                        textColor: Colors.white,
                      ),
                    const SizedBox(height: 15,),
                    FlatButton(
                      child: Text(
                          'SIGNUP' ,
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        email.text.trim();
                        _passwordController.text.trim();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Rgister()));

                      },
                      //padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 9,),
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
      backgroundColor: Colors.white,
      title:const Text("Warning:", style: TextStyle(
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


