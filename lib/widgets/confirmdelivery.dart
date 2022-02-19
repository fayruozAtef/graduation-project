import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'confirmtable.dart';
import 'home.dart';

class confdeliv extends StatefulWidget {
  List<List<String>> test2;
  String address='';
  String exphone='';
  String phone='';

  final String userId;
  confdeliv({Key? key, required this.test2,required this.address,required this.phone,required this.exphone ,required this.userId}) : super(key: key);

  @override
  createState(){
    return MyAppState(test: test2,address: address,phone: phone,exphone: exphone,userId: userId);
  }
}
class MyAppState extends State<confdeliv> {
  List<List<String>> test;
  String address='';
  String exphone='';
  String phone='';

  final String userId;
  MyAppState({Key? key, required this.test,required this.address,required this.phone,required this.exphone,required this.userId }) : super();
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
                      Expanded(
                          child:Text(address,maxLines: 3,softWrap: false,overflow:TextOverflow.ellipsis,style:TextStyle(color:Colors.black,fontSize: 20)) ),

                    ]
                ),
              ),



              Container(

                padding: EdgeInsets.all(10),


                child:Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('your phone : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text(phone,style:TextStyle(color:Colors.black,fontSize: 20))
                    ]
                ),
              ),
              Container(

                padding: EdgeInsets.all(10),


                child:Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('your extra phone : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text(exphone,style:TextStyle(color:Colors.black,fontSize: 20))
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
                onPressed: () async {
                   CollectionReference data = FirebaseFirestore.instance.collection("delivery");
                    await data.doc().set(
                        {"address":address,"phone":phone,"extra phone":exphone,"user id":userId},
                     SetOptions(merge: true),
                    );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>home(userId: userId,)));
                    },
                child: Text('Confirm',style:TextStyle(fontSize: 30)),
              ),

            ]
        ),
      ),
    );
  }
}