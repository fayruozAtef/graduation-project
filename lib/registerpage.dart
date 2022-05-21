import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/auth.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'authscreen.dart';


/*class Rgister extends StatelessWidget {
  static const routeName = '/auth';

  //const AuthScreen({Key? key}) : super(key: key);

  @override
  /*Widget build(BuildContext context) {
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
            appBar: AppBar(
              title: const Text("Registeration",style: TextStyle(color: Colors.white,fontSize:22)),
              backgroundColor: Colors.black,),
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
}*/
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Back(),
        const SizedBox(height: 200,),
        Container(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Register",style: TextStyle(color: Colors.white,fontSize:22)),
              backgroundColor: Colors.black,),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      opacity: 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AuthCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/

class Rgister extends StatelessWidget {
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
          const Back(),
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
    'fname':'',
    'lname':'',
    'phone':'',
    'gender':'',

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
          'Gender':_autData['gender']
        }

        ).then((value) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthScreen()));
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
                    const Text('Welcome',
                        style: TextStyle(color: Colors.white,
                            fontSize: 30,
                            fontFamily:'Time New Roman'),
                        textAlign:TextAlign.right),
                    const SizedBox(height: 50,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'F-name' ,
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        validator: (value){
                          _autData['firstname']=value!;
                         if(value!.isEmpty ){
                              return ' please enter first name ';
                        }},
                        onSaved: (value) {
                          _autData['fname']=value!;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(
                            labelText: 'L-name' ,
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        validator: (value){
                          _autData['lastname']=value!;
                          if(value!.isEmpty ){
                            return ' please enter last name ';
                          }
                        },
                        onSaved: (value) {
                          _autData['lname']=value!;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(
                            labelText: 'phone' ,
                            labelStyle: TextStyle(color: Colors.white)),
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
                        if(value!.isEmpty || !value.contains('@')||!value.contains('.com')){
                          return 'Invalid Email! ';
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
                      TextFormField(
                        decoration:const InputDecoration(
                            labelText: 'confirm password' ,
                            labelStyle: TextStyle(color: Colors.white,fontSize: 18)),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        validator:(value) {
                          if(value !=_passwordController.text){
                            return 'passwords do not match!' ;
                          }
                        }
                      ),
                      Container(
                        padding:EdgeInsets.all(2),
                        child:Row(
                            children:[
                              Text('Gender : ',style:TextStyle(color:Colors.white,fontSize: 17,)),
                              Radio<String>(value: 'male',
                                groupValue: _autData['gender'],
                                onChanged: (value) {
                                  setState((){
                                    _autData['gender']=value!;
                                  });
                                },
                              ),
                              Text('Male',style:TextStyle(color:Colors.white,fontSize: 20)),
                              Radio<String>(value: 'female',
                                groupValue:  _autData['gender'],
                                onChanged: (value) {
                                  setState((){
                                    _autData['gender']=value!;
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
                        Text('SIGN UP',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed:() {
                          _signup();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 8.0),
                        color: Color.fromRGBO(65, 189, 180, 54),
                        textColor: Colors.white,
                      ),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
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


