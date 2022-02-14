import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resflutter_app/authscreen.dart';

import 'categorydrawer.dart';
import 'dateAndtime.dart';
// @dart=2.9
import 'qr_scan_page.dart';


final List<String> imgList = [
  'assets/images/rest1.jpg',
  'assets/images/rest2.jpg',
  'assets/images/rest3.jpg',
  'assets/images/rest4.jpg',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    child: ClipRRect(
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover),
          ],
        )),
  ),
))
    .toList();

class home extends StatelessWidget {
  final String userId;
  String uname='';
  String uemail='';
  home({Key? key,required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        title: Text('The Restaurant',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
      ),
      drawer:Drawer1(),
      body:SingleChildScrollView(
        child: Column(
            children:<Widget> [
              const SizedBox(height: 10.0),
              Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.9,
                      //enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imageSliders,
                  )),
              const SizedBox(height: 6.0),
              SizedBox(height:170,
                width: width,
                child:Card(
                  child:InkWell(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>Body()));
                  },
                    child: Container(
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/reserved.jpg"),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const Text('Reserve',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(height:170,
                width: width,
                child: Card(
                  child:InkWell(onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => QRScanPage()));
                  },
                    child: Container(
                      decoration: const BoxDecoration(
                        image:  DecorationImage(
                          image: AssetImage("assets/images/inhall.jpg"),
                          fit:BoxFit.fill,
                          opacity:40,
                        ),
                      ),
                      child:const Text('In-Hall',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
                      alignment:Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:170,
                width: width,
                child:Card(
                  child:InkWell(onTap: () {
                    /*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ));*/
                  },
                    child: Container(
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/delivery.jpg"),
                          fit:BoxFit.fill,
                          opacity:47,
                        ),
                      ),
                      child: const Text('Delivery',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
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


class Drawer1 extends StatefulWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  createState(){
    return MyAppState();
  }
}

class MyAppState extends State<Drawer1>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("Name",style:TextStyle(color:Colors.black)),
            accountEmail: Text("Email",style:TextStyle(color:Colors.black)),
            currentAccountPicture:CircleAvatar(
              child:ClipOval(
                child:Image.asset('assets/images/avatar1.jpg',
                  width:80,
                  height:80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white38,
            ),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title:Text('My Personal Info'),
            onTap:(){},
          ),
          ListTile(
            leading:Icon(Icons.monetization_on),
            title:Text('Coins'),
            onTap:(){},
          ),
          ListTile(
            leading:Icon(Icons.menu_book),
            title:Text('Menu'),
            onTap:(){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Categories2()));
            },
          ),
          ListTile(
            leading:Icon(Icons.article),
            title:Text('About us'),
            onTap:(){},
          ),
          ListTile(
            leading:Icon(Icons.add_ic_call_outlined),
            title:Text('Contact'),
            onTap:(){},
          ),
          ListTile(
            leading:Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap:() async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>AuthScreen() ));

            }
          ),
        ],
      ),
    );
  }
}