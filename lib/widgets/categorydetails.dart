import 'package:flutter/material.dart';

class categirydetail extends StatefulWidget {
  String title;
   categirydetail({Key? key, required this.title}) : super(key: key);

  @override
  createState(){
    return MyAppState(title2: title);
  }
}

class MyAppState extends State<categirydetail> {

  String title2;
  MyAppState({Key? key, required this.title2}) : super();
  double tprice=49.99;
  var t='49.99';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('$title2',style: const TextStyle(color: Colors.black,fontSize:25)),
        backgroundColor: Colors.white,
        foregroundColor:Colors.black,
      ),
      body:SingleChildScrollView(
          child:Column(
            children: [
              const SizedBox(height:10),
              Card(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(13.0),
                  side:const BorderSide(color:Colors.black,width:2),
                ),
                child:SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height:175,
                        width:600,
                        child: Image(
                          image:  AssetImage("assets/images/eng bf.png"),
                        ),
                      ),
                      ExpansionTile(
                          collapsedIconColor: Colors.black,
                          iconColor: Colors.black,
                          childrenPadding:EdgeInsets.all(16).copyWith(top:0),
                          title:const  Text(
                              'English Breakfast',style:TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)
                          ),
                          children:const [
                            Text('Omelette + Hotdog + Toast + Jam + Butter.',style:TextStyle(color:Colors.black,fontSize: 20)),
                          ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child:Text('Price : ${t} LE.',style:TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
                            ),
                        ],
                      ),
                      const SizedBox(height:10),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}