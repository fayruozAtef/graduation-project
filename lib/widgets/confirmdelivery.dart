import 'package:flutter/material.dart';
import 'confirmtable.dart';

class confdeliv extends StatefulWidget {
  List<List<String>> test2;
  confdeliv({Key? key, required this.test2 }) : super(key: key);

  @override
  createState(){
    return MyAppState(test: test2);
  }
}
class MyAppState extends State<confdeliv> {
  List<List<String>> test;
  MyAppState({Key? key, required this.test }) : super();
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
            'Confirm', style: TextStyle(color: Colors.black, fontSize: 25)),
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
                child:Text('Order Summary : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
              ),
              table(orders: test),
              Container(

                padding: EdgeInsets.all(10),
                child:Row(

                    children:[
                      Text('your address : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text('25-shoubra.st',style:TextStyle(color:Colors.black,fontSize: 20))
                    ]
                ),
              ),



              Container(

                padding: EdgeInsets.all(10),


                child:Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('your phone : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text('01156677394',style:TextStyle(color:Colors.black,fontSize: 20))
                    ]
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
                onPressed: () {},
                child: Text('Confirm',style:TextStyle(fontSize: 30)),
              ),

            ]
        ),
      ),
    );
  }
}