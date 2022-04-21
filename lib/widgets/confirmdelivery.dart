import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/table2.dart';
import '../categories.dart';
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
              const SizedBox(height: 10,),
              table2(orders: test),
              Container(
                padding: EdgeInsets.all(10),
                child:Row(
                    children:[
                Expanded(
                child:RichText(text: TextSpan(
                        text :'your address : ',
                        style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                          children:[
                            TextSpan(text :address,
                                style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.normal),
                            ),
                          ],
                      ),
                          maxLines: 3,
                          softWrap: false,
                          overflow:TextOverflow.ellipsis
                      ),
                ),
                      ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child:Row(
                    children:[
                      Text('your phone : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      Text(phone,style:TextStyle(color:Colors.black,fontSize: 20))
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child:Row(
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
                  Map<String,List> order=Map();
                  for(int i=0;i<test.length;i++){
                    if(test[i][0]=='')
                      test.removeAt(i);
                  }
                  print("test2: $test");
                  for(int i=0;i<test.length;i++){
                    test[i].add('0');
                    order['order${i}']=test[i];
                  }
                  print("test: $test");

                   CollectionReference data = FirebaseFirestore.instance.collection("delivery");
                   int i=0;
                    await data.doc().set(
                        {"address":address,"phone":phone,"extra phone":exphone,"user id":userId,"order":order,"date":DateTime.now(),"location":'Delivery',"const":'50',"finished":'0'},
                    );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>home(userId: userId,)));
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
                      MaterialPageRoute(builder: (context) =>Categories(userId: userId, subOrder: test,exphone: exphone,address: address,phone: phone,)));
                },
                child: Text('Add More',style:TextStyle(fontSize: 30)),
              ),
            ]
        ),
      ),
    );
  }
}