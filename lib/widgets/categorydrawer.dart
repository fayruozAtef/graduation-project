import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/breakfast.dart';
import 'package:resflutter_app/widgets/home.dart';

import 'categorydetails.dart';

class Categories2 extends StatefulWidget {
  const Categories2({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories2> {
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
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>categirydetail(title: 'Breakfast',)));
                  },
                    child: Container(
                      decoration:const  BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/breakfast.jpeg"),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>categirydetail(title: 'Main dishes',)));
                  },
                    child: Container(
                      decoration:const  BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/maindish.jpg"),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const  Text('Main dishes',
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
                    Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>categirydetail(title: 'Soft drinks',)));
                  },
                    child: Container(
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/softdrinks.jpeg"),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Softdrinks',
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>categirydetail(title: 'Desert',)));
                  },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/dessert.jpg"),
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
    );
  }
}
