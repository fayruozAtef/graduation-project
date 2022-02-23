import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/confirmdelivery.dart';
import 'package:resflutter_app/widgets/details.dart';
import 'package:resflutter_app/widgets/detailsinHall.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

List<List<String>> totalOrder=[];
double x=0.0;
List<String> imgList=['','','','','','','','',''];
class CategoriesinHall extends StatefulWidget {
  List<String>subOrder=[];
  String tableno;
  CategoriesinHall({Key? key ,required this.subOrder, required this.tableno}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(subOrder2: subOrder , tableNo: this.tableno);
}

class _CategoriesState extends State<CategoriesinHall> {
  String tableNo;
  List<String>subOrder2=[];
  _CategoriesState({Key? key ,required this.subOrder2, required this.tableNo}) ;

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
    if(subOrder2[2]=='0'){
      totalOrder=[];
    }
    x=0.0;
    totalOrder.add(subOrder2);
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
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Breakfast', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[0]),
                          fit:BoxFit.fill,
                          opacity:40,
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
                width: width,
                child: Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Salads', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[1]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Salad',
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
                width: width,
                child:Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Appetizers', table: tableNo ,)));
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[2]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Appetizers',
                          style:TextStyle(color:Colors.white,
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
                width: width,
                child:Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Soups', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image:  NetworkImage(imgList[3]),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Soup',
                          style:TextStyle(color:Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Main Dishes', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[4]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Main Dishes',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Pasta', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[5]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Pasta',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Pizza', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[6]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Pizza',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Drinks', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[7]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Drinks',style:TextStyle(color:Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)
                      ),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>detailsinHall(title: 'Desserts', table: tableNo ,)));
                  },
                    child: Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgList[8]),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Desserts',style:TextStyle(color:Colors.white,
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
      /*if(totalOrder.length>1) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => confdeliv(test2: totalOrder.sublist(1,totalOrder.length))));

      }*/
    },
    label: Text('${x}'+' | '+'CheckOut Now '),
  );

}


