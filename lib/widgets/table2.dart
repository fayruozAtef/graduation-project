import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class table2 extends StatefulWidget{
  List<List<String>> orders;
  table2({required this.orders});
  @override
  createState() {
    return (_table2(orders: orders));
  }
}
class _table2 extends State<table2>{
  List<List<String>> orders;
  _table2({required this.orders});

  String getSum(){
    double sum=0;
    for(int i=0;i<orders.length;i++) {
      sum+=double.parse(orders[i][2]) ;
    }
    return sum.toString();
  }
  void empty(int n){
    setState((){
      orders[n][0]='';
      orders[n][1]='';
      orders[n][2]='';
    });
  }
  List weidth=[140,40,120];
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                width: 140,
                child:Text('Items',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
              ),
              Container(
                width: 40,
                child:
                Text('Qty',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
              ),
              Container(
                width: 120,
                child:
                Text('Price',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
              ),
            ],
          ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          for(int i=0;i<orders.length;i++)
            if(orders[i][2]!='0')
              Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  width: 140,
                  child:Text(orders[i][0],style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 40,
                  child:Text('x'+orders[i][1],style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                Container(
                  width: 120,
                  child:Text(orders[i][2],style: TextStyle( color: Colors.black, fontSize: 20,)),
                ),
                FloatingActionButton(
                  child:Icon(Icons.highlight_remove ,color:Colors.red,size:20),
                  onPressed: (){
                    empty(i);
                    orders.removeAt(i);
                    print(orders);
                  },
                  backgroundColor:Colors.white,
                  mini:true,
                ),
              ],
            ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          Row(
            children:[
              Container(
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                width: 140,
                child: Text('Sub-Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 40,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 120,
                child:Text(getSum(),style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          Row(
            children:[
              Container(
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                width: 140,
                child:Text('Delivery',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 40,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 120,
                child:Text('50',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          Row(
            children:[
              Container(
                width: 140,
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                child: Text('Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 40,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 120,
                child: Text((double.parse(getSum())+50).toString(),style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
        ],
      ),
    );

  }

}