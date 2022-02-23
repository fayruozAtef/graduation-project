import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'confirmtable.dart';
import 'home.dart';

class ordercon extends StatefulWidget {
  List<List<String>> test2;
  final String userId;
  ordercon({Key? key, required this.test2,required this.userId}) : super(key: key);

  @override
  createState(){
    return MyAppState(test: test2,userId: userId);
  }
}
class MyAppState extends State<ordercon> {
  List<List<String>> test;
  final String userId;
  MyAppState({Key? key, required this.test,required this.userId }) : super();
  TableRow buildRow(List<String> cells,{bool isHeader = false}) => TableRow(
    children:cells.map((cell) {
      final style=TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        color: isHeader ? Colors.teal : Colors.black ,
        fontSize:20,
      );
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Center(child: Text(cell,style:style)),
      );
    }
    ).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Confirm Order ', style: TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
      child: Column(
         children: [
         const SizedBox(height: 10.0,),
         Container(
          height: 50,
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child:Text('Order Summary : ',
             style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
       ),
       table(orders: test),
           Container(
             height: 120,
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(5)),
                 border: Border.all(color: Colors.white12,width: 10.0,)
             ),
             child: Center(
               child: ButtonTheme(
                 minWidth: 150.0,
                 height: 50.0,
                 child: RaisedButton(
                   child: Text('Confirm',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 26,
                     ),),
                   color: Color.fromRGBO(65, 189, 180, 54),

                   shape: RoundedRectangleBorder(
                     borderRadius:  BorderRadius.circular(12.0),
                   ),
                   onPressed: () {
                     Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (context) =>home(userId: userId,)));
                   },

                 ),
               ),
             ),
           )
      ],
      ),
    ),
    );
  }
}