import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'openMyOrders.dart';
import 'package:intl/intl.dart';

class myorders extends StatefulWidget {

  final String uid;
  myorders({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>_myorders(uid:uid);
}

class _myorders extends State<myorders> {

  final String uid;
  _myorders({required this.uid});

List orders=[];
List<double> total=[];
  CollectionReference bff = FirebaseFirestore.instance.collection("delivery");
  getData() async {
    QuerySnapshot db = await bff.where('user id',isEqualTo:uid).get();
    db.docs.forEach((element) {
      setState(() {
        orders.add(element.data());
        total.add(0);
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  String formattedDate(timeStamp){
    var dateFormTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds*1000);
    return DateFormat('dd-MM-yyy hh:mm a').format(dateFormTimeStamp);
  }

  @override
  Widget build(BuildContext context) {


    for(int i=0;i<orders.length;i++) {
      for (var j in (orders[i]['order']).values) {
        total[i]+=(double.parse(j[2]));
      }
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(
        title: Text('My Orders',style: TextStyle(color: Colors.white,fontSize:25)),
    backgroundColor: Colors.black,
    foregroundColor:Colors.white,
    ),
    body:SingleChildScrollView(
      child:Column(
        children: [
          SizedBox(height: 8),
          for(int i=0;i<orders.length;i++)
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 0.30),
            ),
            child:InkWell(onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>open(orders: orders[i],)));
            },
              child: Container(
                width: width,
                height:70,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattedDate(orders[i]['date']),style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                    Container(
                      width:110,
                      height:60,
                      alignment: Alignment.centerRight,
                      child: Expanded(
                          child:Text('${total[i]+double.parse(orders[i]['const'])} EGP',maxLines: 2,softWrap: false,overflow:TextOverflow.ellipsis,style:TextStyle(color:Colors.black,fontSize: 22, fontWeight: FontWeight.bold)) ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
     ),
    );
  }
}