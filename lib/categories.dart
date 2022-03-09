
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/confirmdelivery.dart';
import 'package:resflutter_app/widgets/details.dart';
import 'package:resflutter_app/widgets/home.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

List<List<String>> totalOrder=[];
double x=0.0;
List<String> imgList=['','','','','','','','',''];
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

  dowurl() async{
    String durl1 = await firebase_storage.FirebaseStorage.instance.ref('assets/breakfast.jpeg').getDownloadURL();
    String durl2 = await firebase_storage.FirebaseStorage.instance.ref('assets/salads.jpg').getDownloadURL();
    String durl3 = await firebase_storage.FirebaseStorage.instance.ref('assets/Appetizers.jpeg').getDownloadURL();
    String durl4 = await firebase_storage.FirebaseStorage.instance.ref('assets/soup.jpg').getDownloadURL();
    String durl5 = await firebase_storage.FirebaseStorage.instance.ref('assets/maindish.jpg').getDownloadURL();
    String durl6 = await firebase_storage.FirebaseStorage.instance.ref('assets/pasta.jpg').getDownloadURL();
    String durl7 = await firebase_storage.FirebaseStorage.instance.ref('assets/pizza.jpg').getDownloadURL();
    String durl8 = await firebase_storage.FirebaseStorage.instance.ref('assets/drinks.jpg').getDownloadURL();
    String durl9 = await firebase_storage.FirebaseStorage.instance.ref('assets/dessert.jpg').getDownloadURL();

    setState((){
      imgList[0]=(durl1);
      imgList[1]=(durl2);
      imgList[2]=(durl3);
      imgList[3]=(durl4);
      imgList[4]=(durl5);
      imgList[5]=(durl6);
      imgList[6]=(durl7);
      imgList[7]=(durl8);
      imgList[8]=(durl9);
    });

  }
  @override
  void initState() {
    dowurl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(subOrder2[0][2]=='0'){
      totalOrder=[];
    }
    for(int i=0;i<subOrder2.length;i++)
      totalOrder.add(subOrder2[i]);
    x=0.0;
    for(int i=1;i<totalOrder.length;i++)
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
              SizedBox(height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>details(title: 'Breakfast',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[0]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Breakfast',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>details(title: 'Salads',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[1]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Salads',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>details(title: 'Appetizers',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[2]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Appetizers',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>details(title: 'Soups',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[3]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Soup',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child: Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Main Dishes',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[4]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Main Dishes',
                          style:TextStyle(
                              color:Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child: Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Pasta',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[5]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Pasta',
                          style:TextStyle(
                              color:Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width:width,
                child: Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Pizza',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[6]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child:const  Text('Pizza',
                          style:TextStyle(
                              color:Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Drinks',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[7]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Drinks',
                        style:TextStyle(color:Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:190,
                width:width,
                child:Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Desserts',address:address,phone:phone,exphone:exphone,userId:userId)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[8]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Desserts',
                          style:TextStyle(color:Colors.white,
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
      if(totalOrder.length>1) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    confdeliv(test2: totalOrder.sublist(1,totalOrder.length),address:address,phone:phone,exphone:exphone,userId:userId)));

      }
    },
    label: Text('${x}'+' | '+'CheckOut Now '),
  );

}