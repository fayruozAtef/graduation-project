import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'detailsinHall.dart';
import 'orderconfirm.dart';


double x=0.0;
class CategoriesinHall extends StatefulWidget {
  List<List<String>>totalOrder=[];
  String tableno;
  String userid;
  CategoriesinHall({Key? key ,required this.totalOrder, required this.tableno,required this.userid}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(totalOrder2: totalOrder , tableNo: this.tableno, id: this.userid);
}

class _CategoriesState extends State<CategoriesinHall> {
  String tableNo;
  List<List<String>>totalOrder2=[];
  String id;
  _CategoriesState({Key? key ,required this.totalOrder2, required this.tableNo, required this.id}) ;
  List list = [];
  CollectionReference bff = FirebaseFirestore.instance.collection("categories");
  getData() async {
    QuerySnapshot dbf = await bff.orderBy("type").get();
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
    x = 0.0;
    if(totalOrder2.length>0) {
      for (int j = 0; j < totalOrder2.length; j++) {
        if (totalOrder2[j][2] == '0' || totalOrder2[j][2] == '') {
          totalOrder2.removeAt(j);
        }
      }
      for (int i = 0; i < totalOrder2.length; i++) {
        x += double.parse(totalOrder2[i][2]);
      }
    }
    print(totalOrder2);

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
                SizedBox(
                  height:190,
                  width:width,
                  child:Card(
                    child:InkWell(onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>detailsinHall(title: list[i]['type'], table: tableNo, userid: id,order: totalOrder2,)));
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
      if(totalOrder2.length>0) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    ordercon(test2: totalOrder2,userId:id, tno: tableNo,)));
      }
    },
    label: Text('${x}'+' | '+'CheckOut Now '),
  );
}
