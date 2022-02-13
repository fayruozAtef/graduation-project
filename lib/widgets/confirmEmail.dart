// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'back.dart';

class ConfirmEmail extends StatefulWidget{

  @override
  State<ConfirmEmail> createState() => _MyConfirm();
}

class _MyConfirm extends State<ConfirmEmail> {
  @override
  Widget build(BuildContext context)=>Stack(
    children: <Widget>[
      const Back(),
      Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text('Confirm your email', style: TextStyle(fontSize: 20, color: Colors.white),),
                backgroundColor: Colors.black,
            ),
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50.0,),
                      Container(
                        padding:const  EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child:const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Confirmation code:',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      const TextField(
                        maxLength: 6,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white ,fontSize: 20),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const SizedBox(
                        height: 70.0,
                        width: 200.0,
                        child: RaisedButton(
                          onPressed: null,
                          shape:StadiumBorder(),
                          color: Color.fromRGBO(65, 189, 180, 54),
                          child: Text('Confirm',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const FlatButton(
                          onPressed: null,
                          child: Text('Re-Send',
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),)
                      ),
                    ],
                  ),
                ),
              ],
            )
      ),
    ],
  );

}