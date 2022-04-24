import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class table1 extends StatefulWidget{
  List<List<String>> orders;
  table1({required this.orders});
  @override
  createState() {
    return (_table1(orders: orders));
  }
}
class _table1 extends State<table1>{
  List<List<String>> orders;
  _table1({required this.orders});

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

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                width: 150,
                child:Text('Items',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
              ),
              Container(
                width: 45,
                child:
                Text('Qty',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
              ),
              Container(
                width: 109,
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
                    width: 150,
                    child:Text(orders[i][0],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width: 45,
                    child:Text('x'+orders[i][1],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  Container(
                    width: 109,
                    child:Text(orders[i][2],style: TextStyle( color: Colors.black, fontSize: 20,)),
                  ),
                  FloatingActionButton(
                    child:Icon(Icons.highlight_remove ,color:Colors.red,size:20),
                    onPressed: (){
                      empty(i);
                      orders.removeAt(i);
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
                width: 150,
                child: Text('Sub-Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 45,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 109,
                child:Text(getSum(),style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          Row(
            children:[
              Container(
                width: 150,
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                child: Text('Service',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 45,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 109,
                child: Text('${((double.parse(getSum())*14)/100)}',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
          Text('-------------------------------',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 20,)),
          Row(
            children:[
              Container(
                width: 150,
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                child: Text('Total',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 45,
                child:Text('-',style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
              Container(
                width: 109,
                child: Text(((double.parse(getSum()))+((double.parse(getSum())*14)/100)).toString(),style: TextStyle( color: Colors.black, fontSize: 20,)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}