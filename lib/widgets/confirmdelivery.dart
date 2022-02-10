import 'package:flutter/material.dart';
import 'confirmtable.dart';


List<List<String>> test=[
  ['english breakfast','x2','99.99'],
  ['pizza','x1','50'],
  ['water','x1','10'],
];

class confdeliv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _confdeliv();
  }
}
class _confdeliv extends StatefulWidget {


  const _confdeliv({Key? key}) : super(key: key);

  @override
  createState(){
    return MyAppState();
  }
}
class MyAppState extends State<_confdeliv> {

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
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child:Text('Order Summary : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
              ),
              Container(

                padding: EdgeInsets.all(10),
                child:Row(

                    children:[
                      Text('your address : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text('25-shoubra.st',style:TextStyle(color:Colors.black,fontSize: 20))
                    ]
                ),
              ),

              table(orders: test),

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