import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/table2.dart';
import 'confirmtable.dart';
import 'home.dart';

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
  _orderon({Key? key, required this.test,required this.userId,required this.tano }) : super();

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
       table2(orders: test),
           Padding(padding: EdgeInsets.only(top: 20),),
           Container(
             height: 50,
             child: Row(
               children: [
                 Container(
                   padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                   child:const Text('Table: ',
                     style:TextStyle(
                       color: Colors.black,
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.fromLTRB(5,10.0,0,5),
                   child: Text(tano,
                     style:TextStyle(
                       color: Colors.black,
                       fontSize: 24,
                     ),),
                 ),
               ],
             ),
           ),
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