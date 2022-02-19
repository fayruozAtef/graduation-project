import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/confirmdelivery.dart';
import 'package:resflutter_app/widgets/details.dart';
import 'package:resflutter_app/widgets/home.dart';
List<List<String>> totalOrder=[];
double x=0.0;
class Categories extends StatefulWidget {
  List<String>subOrder=[];
  String address='';
  String exphone='';
  String phone='';

  final String userId;
   Categories({Key? key ,required this.subOrder,required this.address,required this.phone,required this.exphone,required this.userId}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState(subOrder2: subOrder,address: address,phone: phone,exphone: exphone,userId: userId);
}

class _CategoriesState extends State<Categories> {
  List<String>subOrder2=[];
  String address='';
  String exphone='';
  String phone='';

  final String userId;
  _CategoriesState({Key? key ,required this.subOrder2,required this.address,required this.phone,required this.exphone,required this.userId}) ;

  List bf=[
    "assets/images/pancakes.jpg",
    "assets/images/club sandwish.jpg",
    "assets/images/eng bf.png",

  ];
  List dessert=[
    "assets/images/om ali.jpg",
    "assets/images/cheese cake.jpg",
    "assets/images/waffel.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(subOrder2[2]=='0'){
      totalOrder=[];
    }
    totalOrder.add(subOrder2);
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
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>details(title: 'Breakfast',image2:bf,address:address,phone:phone,exphone:exphone,userId:userId)));
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => details(title: 'Desserts',image2:dessert,address:address,phone:phone,exphone:exphone,userId:userId)));
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
                builder: (context) =>
                    confdeliv(test2: totalOrder.sublist(1,totalOrder.length),address:address,phone:phone,exphone:exphone,userId:userId)));

      }
      },
      label: Text('${x}'+' | '+'CheckOut Now '),
  );

}


