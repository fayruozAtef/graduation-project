import 'package:flutter/material.dart';
import 'backWithOpacity.dart';

class aboutus extends StatefulWidget {
  aboutus({Key? key,}) : super(key: key);

  @override
  createState()=>_aboutus();
}

class _aboutus extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackWithOpacity(),
        Scaffold(
          backgroundColor: Colors.transparent,
            appBar:AppBar(
              title: Text('About US',style: TextStyle(color: Colors.white,fontSize:25)),
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