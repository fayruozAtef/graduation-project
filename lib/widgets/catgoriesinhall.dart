import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/detailsinHall.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'orderconfirm.dart';

List<List<String>> totalOrder=[];
double x=0.0;
class CategoriesinHall extends StatefulWidget {
  List<List<String>>subOrder=[];
  String tableno;
  String userid;
  CategoriesinHall({Key? key ,required this.subOrder, required this.tableno,required this.userid}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(subOrder2: subOrder , tableNo: this.tableno, id: this.userid);
}

class _CategoriesState extends State<CategoriesinHall> {
  String tableNo;
  List<List<String>>subOrder2=[];
  String id;
  _CategoriesState({Key? key ,required this.subOrder2, required this.tableNo, required this.id}) ;
  List list = [];
  CollectionReference bff = FirebaseFirestore.instance.collection("categories");
  getData() async {
    QuerySnapshot dbf = await bff.get();
    dbf.docs.forEach((element) {
      setState(() {
        list.add(element.data());
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

    for (int i = 0; i < subOrder2.length; i++) {
      totalOrder.add(subOrder2[i]);
      subOrder2.removeAt(i);
    }

    for(int j=0;j<totalOrder.length;j++){
      if(totalOrder[j][2]=='0' || totalOrder[j][2]==''){
        totalOrder.removeAt(j);
      }
    }

    x=0.0;
    for(int i=0;i<totalOrder.length;i++)
    {
      x+=double.parse(totalOrder[i][2]);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your order' ,
            style: TextStyle(color: Colors.white, fontSize: 25,
              fontWeight: FontWeight.bold,
            )
        ),
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Column(
            children:<Widget> [
              const SizedBox(height: 10.0),
              Align(
                  alignment: Alignment.topLeft,
                  child:
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:const Text('Categories: ', style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  )
              ),
              const SizedBox(height: 6.0),
              for(int i = 0; i < list.length; i++)
                SizedBox(height:190,
                  width:width,
                  child:Card(
                    child:InkWell(onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>detailsinHall(title: list[i]['type'], table: tableNo, userid: id,)));
                    },
                      child: Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image:  NetworkImage(list[i]['imagepath']),
                            fit:BoxFit.fill,
                            opacity:47,
                          ),
                        ),
                        child:  Text(list[i]['type'],style:TextStyle(color:Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)
                        ),
                        alignment:Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ),

            ]
        ),
      ),
      floatingActionButton: buildNavigateButton(),
    );
  }
  Widget buildNavigateButton()=>FloatingActionButton.extended(
    backgroundColor: Colors.teal,
    onPressed: (){
      if(totalOrder.length>0) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    ordercon(test2: totalOrder,userId:id, tno: tableNo,)));
      }
    },
    label: Text('${x}'+' | '+'CheckOut Now '),
  );
}