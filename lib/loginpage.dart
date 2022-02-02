import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/home.dart';
import 'package:resflutter_app/widgets/widgets.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return Stack(
      children: [
        Back(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 35,),
                    Image.asset('assets/images/logo.png' , height: 200,width: 250,),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'user name'
                      ,labelStyle: TextStyle(color: Colors.white)),

                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password'
                      ,labelStyle: TextStyle(color: Colors.white)),
                     obscureText: true,
                     // keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10,
                    ),
                   SizedBox(
                      height:60,
                      width:130,
                      child: RaisedButton(
                        color:Colors.grey.withOpacity(0.1),

                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>home()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        child: Text('LOGIN',
                        style:TextStyle(
                          color: Colors.white,
                        ) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,
                    ),
                    FlatButton(
                      child:Text('SIGNUP'),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                        onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/register');
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

