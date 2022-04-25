import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resflutter_app/widgets/home.dart';

class myReservation extends StatefulWidget {

  final String uid;
  myReservation({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>_myReservation(uid:uid);
}

class _myReservation extends State<myReservation> {

  final String uid;
  _myReservation({required this.uid});

  List list=[];
  List id=[];
DateTime today=DateTime.now();
TimeOfDay time=TimeOfDay.now();
  CollectionReference bff = FirebaseFirestore.instance.collection("reserve");
  getData() async {
    QuerySnapshot db = await bff.where('user id',isEqualTo:uid).where('arrived',isEqualTo: false).get();
    db.docs.forEach((element) {
      setState(() {
        if(today.isBefore(DateTime.parse(element.get('date')))){
          list.add(element.data());
          id.add(element.id);
        }
        if(element.get('date')==DateFormat('yyy-MM-dd').format(today)){
          TimeOfDay t=TimeOfDay(hour:int.parse((element.get('time')).split(":")[0]),minute: int.parse((element.get('time')).split(":")[1]));
          if(time.hour<((t.hour)-2)){
            list.add(element.data());
            id.add(element.id);
          }
        }
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        title: Text('My Reservation',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
        foregroundColor:Colors.white,
      ),
      body:SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 8),
            for(int i=0;i<list.length;i++)
              if(list[i]!='')
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.teal, width: 2),
                ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child:Row(
                              children:[
                                Text('Date : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                                Text(DateFormat('dd-MM-yyy').format(DateTime.parse(list[i]['date']))+'  '+list[i]['time'],style:TextStyle(color:Colors.black,fontSize: 22))
                              ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child:Row(
                              children:[
                                Text('Table No. : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                                Text("${list[i]['tableno']}",style:TextStyle(color:Colors.black,fontSize: 22))
                              ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 2,0, 8),
                        child:ElevatedButton(
                          style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.teal),
                              fixedSize:MaterialStateProperty.all(Size(130,45)),
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(18)
                              ))
                          ),
                          onPressed: ()  {
                            bff.doc(id[i]).delete();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) =>home(userId: uid)));
                          },
                          child: Text('Delete',style:TextStyle(fontSize: 30)),
                        ) ,
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