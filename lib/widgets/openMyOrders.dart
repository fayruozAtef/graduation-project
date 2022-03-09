import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class open extends StatefulWidget {

  final String uid;
  open({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>_open(uid:uid);
}

class _open extends State<open> {

  final String uid;
  _open({required this.uid});

  List<List<String>> orders=[
  ['english breakfast','2','100'],
  ['pizza','1','50'],
  ['water','1','10'],
  ];
  String getSum(){
    int sum=0;
    for(int i=0;i<orders.length;i++) {
      sum+=int.parse(orders[i][2]);
    }
    return sum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        title: Text('Order Details',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
        foregroundColor:Colors.white,
    ),
    body:SingleChildScrollView(
      child:Column(
        children:[
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              alignment: Alignment.centerLeft,
            child:Row(
              children: [
                Text("Date/Time : ",style:TextStyle( color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
                Text("2022/2/8  5:06 pm",style:TextStyle( color: Colors.black, fontSize: 20,)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('In-Hall',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                Text('Order#20',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            alignment: Alignment.centerLeft,
            child:Text('Order Summary : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
            ),
          ),
          Card(
            child:Column(
              children: [
                Row(
                  children: [
                    Container(
                     padding: EdgeInsets.fromLTRB(8,0,0,0),
                     width: 180,
                     child:Text('Items',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
                Container(
                  width: 60,
                  child:
                  Text('Qty',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
                Container(
                  width: 100,
                  child:
                  Text('Price',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            for(int i=0;i<orders.length;i++)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(8,0,0,0),
                    width: 180,
                    child:Text(orders[i][0],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width: 60,
                    child:Text('x'+orders[i][1],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width: 100,
                    child:Text(orders[i][2],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                ],
              ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  width: 180,
                  child: Text('Sub-Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 60,
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 100,
                  child:Text(getSum(),style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  width: 180,
                  child:Text('Delivery',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 60,
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 100,
                  child:Text('50',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
            Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
            Row(
              children:[
                Container(
                  width: 180,
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text('Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 60,
                  child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 100,
                  child: Text((int.parse(getSum())+50).toString(),style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
              ],
            ),
          ],
        ),
      ),
        ],
      ),
    ),
    );
  }
}