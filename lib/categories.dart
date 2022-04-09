import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/confirmdelivery.dart';
import 'package:resflutter_app/widgets/details.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

List<List<String>> totalOrder=[];
double x=0.0;
class Categories extends StatefulWidget {
  List<List<String>>subOrder=[];
  String address='';
  String exphone='';
  String phone='';

  final String userId;
  Categories({Key? key ,required this.subOrder,required this.address,required this.phone,required this.exphone,required this.userId}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(subOrder2: subOrder,address: address,phone: phone,exphone: exphone,userId: userId);
}
class _CategoriesState extends State<Categories> {
  List<List<String>>subOrder2=[];
  String address='';
  String exphone='';
  String phone='';

  final String userId;
  _CategoriesState({Key? key ,required this.subOrder2,required this.address,required this.phone,required this.exphone,required this.userId}) ;

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
                          MaterialPageRoute(builder: (context)=>details(title: list[i]['type'],address:address,phone:phone,exphone:exphone,userId:userId)));
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
                    confdeliv(test2: totalOrder,address:address,phone:phone,exphone:exphone,userId:userId)));
      }
    },
    label: Text('${x}'+' | '+'CheckOut Now '),
  );
}