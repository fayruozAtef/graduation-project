import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/breakfast.dart';
import 'package:resflutter_app/widgets/confirmdelivery.dart';
import 'package:resflutter_app/widgets/details.dart';
import 'package:resflutter_app/widgets/home.dart';
List<List<String>> totalOrder=[];
double x=0.0;
class Categories extends StatefulWidget {
  List<String>subOrder=[];
   Categories({Key? key ,required this.subOrder}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(subOrder2: subOrder);
}

class _CategoriesState extends State<Categories> {
  List<String>subOrder2=[];
  _CategoriesState({Key? key ,required this.subOrder2}) ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(subOrder2[2]=='0'){
      totalOrder=[];
      x=0.0;
    }
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
                        MaterialPageRoute(builder: (context)=>details(title: 'Breakfast',)));
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
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
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
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
      floatingActionButton: buildNavigateButton(),
    );
  }
  Widget buildNavigateButton()=>FloatingActionButton.extended(
    backgroundColor: Colors.teal,
      onPressed: (){
      if(totalOrder.length>1) {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => confdeliv(test2: totalOrder.sublist(1,totalOrder.length))));

      }
      },
      label: Text('${x}'+' | '+'CheckOut Now '),
  );

}


