import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



void main() {
  runApp(MyApp());
}

final List<String> imgList = [
  'assets/rest1.jpg',
  'assets/rest2.jpg',
  'assets/rest3.jpg',
  'assets/rest4.jpg',
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('The Restaurant',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
      ),
      drawer:Drawer1(),
      body:Column(
          children:<Widget> [
            SizedBox(height: 10.0),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.9,
                    //enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imageSliders,
                )),
            SizedBox(height: 6.0),
            SizedBox(height:160,
              width: 300,
              child:Card(
                child:InkWell(onTap: (){
                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>));*/
                },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/reserved.jpg"),
                        fit:BoxFit.cover,
                        opacity:40,
                      ),
                    ),
                    child: Text('Reserve',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
                    alignment:Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            SizedBox(height:160,
              width: 300,
              child: Card(
                child:InkWell(onTap: () {
                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ));*/
                },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/inhall.jpg"),
                        fit:BoxFit.cover,
                        opacity:40,
                      ),
                    ),
                    child: Text('In-Hall',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
                    alignment:Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            SizedBox(
              height:160,
              width: 300,
              child:Card(
                child:InkWell(onTap: () {
                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ));*/
                },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/delivery.jpg"),
                        fit:BoxFit.cover,
                        opacity:47,
                      ),
                    ),
                    child: Text('Delivery',style:TextStyle(color:Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
                    alignment:Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
          ]
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
                child:Image.asset('assets/avatar1.jpg',
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
            onTap:(){},
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
            onTap:(){},
          ),
        ],
      ),
    );
  }
}