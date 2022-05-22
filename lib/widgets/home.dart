import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:resflutter_app/authscreen.dart';
import 'package:resflutter_app/widgets/coins.dart';
import 'package:resflutter_app/widgets/profileInfo.dart';
import 'package:resflutter_app/widgets/rate_service.dart';

import '../deliveryinformation.dart';
import 'aboutUs.dart';
import 'categorydrawer.dart';
import 'contact.dart';
import 'dateAndtime.dart';
// @dart=2.9
import 'myReservation.dart';
import 'myorder.dart';
import 'qr_scan_page.dart';
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    "High Importance Notifcations",
    importance: Importance.max
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationplugin =
FlutterLocalNotificationsPlugin();
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message : ${message.messageId}");
  print(message.data);
}


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
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final CollectionReference _tokensDB =
  FirebaseFirestore.instance.collection('users');
  MyAppState({Key? key,required this.Userid});
  initialize() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationplugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var intializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: intializationSettingsAndroid);

     flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: (String? payload){
      if(payload!=null){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>Rateus(userId:Userid,)));
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("data:${message.data['test']}");
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                'resturant',
                channel.name,
                icon: 'launch_background',
              ),
            ),
            payload: message.data['test']
        );
      }
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message!=null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Rateus(userId:Userid,)));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rateus(userId:Userid,)));
    });

  }

  final List<String> imgList = [
    'assets/images/rest3.jpg',
    'assets/images/rest1.jpg',
    'assets/images/rest4.jpg',
    'assets/images/rest2.jpg',
  ];
  late List<Widget> imageSliders;

  String uname='';
  String uemail='';
  String image='';
  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(Userid);
    var dbu = await data.get();
    setState(() {
      uname = dbu.get("first name") + ' ' + dbu.get("last name");
      uemail = dbu.get("email");
      image=dbu.get('image');
    });
  }
  Future<void> load() async {
    String? token = await _fcm.getToken();
    assert(token != null);
    DocumentReference docRef = _tokensDB.doc("$Userid");
    docRef.update({'token': token});
  }

  @override
  void initState() {
    getData();
    initialize();
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imageSliders=imgList.map((item) => Container(
      child: Container(
        child: ClipRRect(
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.fill),
              ],
            )),
      ),
    ))
        .toList();
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
              UserAccountsDrawerHeader(
                accountName: Text(uname,style:TextStyle(color:Colors.black)),
                accountEmail: Text(uemail,style:TextStyle(color:Colors.black)),
                currentAccountPicture:CircleAvatar(
                    child: ClipOval(
                          child:image!=''?Image.network(image, width:90, height:90, fit: BoxFit.cover,):Image.asset('assets/images/images.png'),
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
                leading:Icon(Icons.history),
                title:Text('My Orders'),
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>myorders(uid: Userid)));

                },
              ),
              ListTile(
                leading:Icon(Icons.table_bar),
                title:Text('My Reservation'),
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>myReservation(uid: Userid)));

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
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>aboutus()));
                },
              ),
              ListTile(
                leading:Icon(Icons.add_ic_call),
                title:Text('Contact'),
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>contact()));
                },
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
                        aspectRatio: 1.6,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imageSliders,
                    )),
                //const SizedBox(height: 6.0),
                SizedBox(height:170,
                  width:width,
                  child:Card(
                    child:InkWell(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>Body(userId: Userid,)));
                    },
                      child: Container(
                        decoration: BoxDecoration(
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
                  width:width,
                  child: Card(
                    child:InkWell(onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => QRScanPage(userid:Userid ,)));
                    },
                      child: Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
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
                  width:width,
                  child:Card(
                    child:InkWell(onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DeliveryInformation(userId:Userid)));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:AssetImage("assets/images/delivery.jpg"),
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
                SizedBox(height: 20,)
              ]
          ),
        ),
      ),
    );
  }
}


