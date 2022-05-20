import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'categorydetails.dart';

class Categories2 extends StatefulWidget {
  const Categories2({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories2> {

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu' ,
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
                  width: width,
                  child:Card(
                    child:InkWell(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>categirydetail(title:  list[i]['type'],)));
                    },
                      child: Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage( list[i]['imagepath']),
                            fit:BoxFit.fill,
                            opacity:40,
                          ),
                        ),
                        child:  Text( list[i]['type'],style:TextStyle(color:Colors.white,
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
    );
  }
}
