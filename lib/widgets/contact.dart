import 'package:flutter/material.dart';
import 'backWithOpacity.dart';

class contact extends StatefulWidget {
  contact({Key? key,}) : super(key: key);

  @override
  createState()=>_contact();
}

class _contact extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackWithOpacity(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:AppBar(
            title: Text('Contact',style: TextStyle(color: Colors.white,fontSize:25)),
            backgroundColor: Colors.black,
            foregroundColor:Colors.white,
          ),
          body:Center(child:
          Text("Coming Soon...",style:TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}