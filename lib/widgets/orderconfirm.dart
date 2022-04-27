import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/catgoriesinhall.dart';
import 'package:resflutter_app/widgets/table1.dart';

class ordercon extends StatefulWidget {
  List<List<String>> test2;
  String userId;
  String tno;
  ordercon({Key? key, required this.test2,required this.userId,required this.tno}) : super(key: key);

  @override
  createState(){
    return _orderon(test: this.test2,userId: this.userId,tano:this.tno);
  }
}

class _orderon extends State<ordercon> {
  List<List<String>> test;
  String userId;
  String tano;
  _orderon({ required this.test,required this.userId,required this.tano });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
         children: [
           const SizedBox(height: 50.0,),
           Container(
             height: 50,
             padding: EdgeInsets.all(8),
             alignment: Alignment.center,
             child:const Text('Confirm',style:TextStyle(color:Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
             ),
           ),
           Container(
             height: 50,
             padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
             alignment: Alignment.centerLeft,
             child:Text('Order Summary : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
             ),
           ),
       table1(orders: test),
           Container(
             height: 50,
             child: Row(
               children: [
                 Container(
                   padding: EdgeInsets.fromLTRB(10.0,20,0,5),
                   child:const Text('Table: ',
                     style:TextStyle(
                       color: Colors.black,
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.fromLTRB(5,20,0,5),
                   child: Text(tano,
                     style:TextStyle(
                       color: Colors.black,
                       fontSize: 24,
                     ),),
                 ),
               ],
             ),
           ),
           SizedBox(height:20),
           ElevatedButton(
             style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.teal),
                 fixedSize:MaterialStateProperty.all(Size(150,45)),
                 shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                     borderRadius:BorderRadius.circular(18)
                 ))
             ),
             onPressed: (){
             },
             child: Text('Confirm',style:TextStyle(fontSize: 30)),
           ),
           SizedBox(height:20),
           ElevatedButton(
             style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.teal),
                 fixedSize:MaterialStateProperty.all(Size(200,45)),
                 shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                     borderRadius:BorderRadius.circular(18)
                 ))
             ),
             onPressed: ()  {
               Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context) =>CategoriesinHall(totalOrder: test, tableno: tano,userid: userId,)));
             },
             child: Text('Add More',style:TextStyle(fontSize: 30)),
           ),

      ],
      ),
    ),
    );
  }
}

