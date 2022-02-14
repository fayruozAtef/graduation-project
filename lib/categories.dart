import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/breakfast.dart';
import 'package:resflutter_app/widgets/home.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your order' ,
            style: TextStyle(color: Colors.white, fontSize: 25,
          fontWeight: FontWeight.bold,
            )
        ),
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Column(
            children:<Widget> [
              SizedBox(height: 10.0),
             Align(
               alignment: Alignment.topLeft,
               child:
               Container(
                 padding: EdgeInsets.all(10),
                 child:Text('Categories: ', style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                   textAlign: TextAlign.left,),
               )
             ),
              SizedBox(height: 6.0),
              SizedBox(height:190,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>breakfast()));
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/breakfast.jpeg"),
                          fit:BoxFit.cover,
                          opacity:40,
                        ),
                      ),
                      child: Text('Breakfast',style:TextStyle(color:Colors.white,
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/maindish.jpg"),
                          fit:BoxFit.cover,
                          opacity:40,
                        ),
                      ),
                      child: Text('Main dishes',
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/softdrinks.jpeg"),
                          fit:BoxFit.cover,
                          opacity:47,
                        ),
                      ),
                      child: Text('Softdrinks',
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/dessert.jpg"),
                          fit:BoxFit.cover,
                          opacity:47,
                        ),
                      ),
                      child: Text('Desserts',
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
