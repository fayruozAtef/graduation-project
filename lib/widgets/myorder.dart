import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'openMyOrders.dart';

class myorders extends StatefulWidget {

  final String uid;
  myorders({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>_myorders(uid:uid);
}

class _myorders extends State<myorders> {

  final String uid;
  _myorders({Key? key,required this.uid});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(
        title: Text('My Orders',style: TextStyle(color: Colors.black,fontSize:25)),
    backgroundColor: Colors.white,
    foregroundColor:Colors.black,
    ),
    body:SingleChildScrollView(
      child:Column(
        children: [
          SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 0.30),
            ),
            child:InkWell(onTap: (){
              Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>open(uid:uid)));
            },
              child: Container(
                width: width,
                height:70,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2022/2/8   5:06 pm',style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                    Container(
                      width:110,
                      height:60,
                      alignment: Alignment.centerRight,
                      child: Expanded(
                          child:Text('Canceled 171110 LE',maxLines: 2,softWrap: false,overflow:TextOverflow.ellipsis,style:TextStyle(color:Colors.black,fontSize: 22, fontWeight: FontWeight.bold)) ),
                    ),
],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}