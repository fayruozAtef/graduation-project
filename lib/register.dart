import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'dart:math' as math;
import 'loginpage.dart';
class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Stack(
      children: [
       Back(),
        Image.asset('assets/images/logo.png' , height: 80,width: 80,
          alignment: Alignment.topLeft,

        ),

        Scaffold(
          backgroundColor: Colors.transparent,

          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(

                  children: <Widget>[
                    SizedBox(height: 80),
                    Text('Register',
                    textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white ,
                      fontSize: 30),

                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.text,
                      style:TextStyle(color:Colors.white),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Second Name'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.text,
                      style:TextStyle(color:Colors.white),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Phone'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      style:TextStyle(color:Colors.white),
                      keyboardType: TextInputType.phone,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-Mail'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      style:TextStyle(color:Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      style:TextStyle(color:Colors.white),
                      // keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Confirm Password'
                          ,labelStyle: TextStyle(color: Colors.white)),
                      obscureText: true,
                      style:TextStyle(color:Colors.white),
                      // keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10,
                    ),
                    SizedBox(
                      height:60,
                      width:130,
                      child: RaisedButton(
                        color:Colors.grey.withOpacity(0.1),

                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text('SIGNUP',
                          style:TextStyle(
                            color: Colors.white,
                          ) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,
                    ),
                    FlatButton(
                      child:Text('LOGIN'),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

