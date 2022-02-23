import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resflutter_app/authscreen.dart';
import 'package:resflutter_app/widgets/coins.dart';
import 'package:resflutter_app/widgets/profileInfo.dart';
import '../deliveryinformation.dart';
import 'categorydrawer.dart';
import 'dateAndtime.dart';
// @dart=2.9
import 'qr_scan_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

List<String> imgList=[];
List<String> bodyimgList=['','',''];//0 -> reserve  1-> in hall  2-> delivery

class home extends StatefulWidget {
  final String userId;
  home({Key? key,required this.userId}) : super(key: key);

  @override
  createState(){
    return MyAppState(Userid: userId);
  }
}
List<Widget> imageSliders=[];
class MyAppState extends State<home>{
  final String Userid;
  MyAppState({Key? key,required this.Userid});

  dowurl() async{
    String durl1 = await firebase_storage.FirebaseStorage.instance.ref('assets/rest1.jpg').getDownloadURL();
    String durl3 = await firebase_storage.FirebaseStorage.instance.ref('assets/rest2.jpg').getDownloadURL();
    String durl2 = await firebase_storage.FirebaseStorage.instance.ref('assets/rest3.jpg').getDownloadURL();
    String durl4 = await firebase_storage.FirebaseStorage.instance.ref('assets/rest4.jpg').getDownloadURL();

    String reserveim = await firebase_storage.FirebaseStorage.instance.ref('assets/reserved.jpg').getDownloadURL();
    String inhallim = await firebase_storage.FirebaseStorage.instance.ref('assets/inhall.jpg').getDownloadURL();
    String deliveryim = await firebase_storage.FirebaseStorage.instance.ref('assets/delivery.jpg').getDownloadURL();

    setState((){
      imgList.add(durl1);
      imgList.add(durl2);
      imgList.add(durl3);
      imgList.add(durl4);
      bodyimgList[0]=(reserveim);
      bodyimgList[1]=(inhallim);
      bodyimgList[2]=(deliveryim);
    });
    imageSliders=[];
    imageSliders = imgList
        .map((item) => Container(
      child: Container(
        child: ClipRRect(
            child: Stack(
              children: <Widget>[
                Image(image: NetworkImage(item)),
              ],
            )),
      ),
    ))
        .toList();
  }

  String uname='';
  String uemail='';

  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(Userid);
    var dbu = await data.get();
    setState(() {
      uname = dbu.get("first name") + ' ' + dbu.get("last name");
      uemail = dbu.get("email");
    });

  }
  @override
  void initState() {
    dowurl();
    getData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: Text('The Restaurant',style: TextStyle(color: Colors.white,fontSize:25)),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child:ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(accountName: Text(uname,style:TextStyle(color:Colors.black)),
                accountEmail: Text(uemail,style:TextStyle(color:Colors.black)),
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
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>profileInfo(uid: Userid)));

                },
              ),
              ListTile(
                leading:Icon(Icons.monetization_on),
                title:Text('Coins'),
                onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Coins(user: Userid)));
                },
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
        ),
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
                  width:width,
                  child:Card(
                    child:InkWell(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>Body()));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(bodyimgList[0]),
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
                  width:width,
                  child: Card(
                    child:InkWell(onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => QRScanPage()));
                    },
                      child: Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(bodyimgList[1]),
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
                  width:width,
                  child:Card(
                    child:InkWell(onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DeliveryInformation(userId:Userid)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(bodyimgList[2]),
                            fit:BoxFit.fill,
                            opacity:40,
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
      ),
    );
  }
}


