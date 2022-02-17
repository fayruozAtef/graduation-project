import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/backWithOpacity.dart';

class Coins extends StatefulWidget{
  String user;
  Coins({Key ? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _coins(userId: this.user);
}
class _coins extends State<Coins>{
  final String userId;
  _coins({Key ? key, required this.userId}):super();

  int coin=0;

  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(userId);
    var dbu = await data.get();
    setState(() {
      coin = dbu.get("coins");
    });
  }
  @override
  void initState() {
    getData();
    print(coin);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackWithOpacity(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title:const  Text('Coins and Rewards:',
            style: TextStyle( fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
            backgroundColor: Colors.black,
          ),

          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        padding:const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal.withOpacity(0.7),
                        ),
                        child: Text('Your Coins is : ${coin}',
                          style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15.0,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Rewards: ',
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Column(
                              children: [
                                SizedBox(
                                  height:170,
                                  width: (MediaQuery.of(context).size.width-30)/2,
                                  child:Card(
                                    child:InkWell(onTap: () {},
                                      child: Container(
                                        decoration:const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/softdrinks.jpeg"),
                                            fit:BoxFit.fill,
                                            opacity:47,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width-30)/2,
                                  height: 60.0,
                                  child: MaterialButton(
                                    child:const Text('Get a softdrink with 400 coin' ,style: TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                    onPressed: () {  },),
                                ),
                              ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {},
                                    child: Container(
                                      decoration:const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/pancakes.jpg"),
                                          fit:BoxFit.fill,
                                          opacity:47,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width-30)/2,
                                height: 60.0,
                                child: MaterialButton(
                                  child: const Text('Get a panckake with 800 coin' ,style: TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () {  },),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {},
                                    child: Container(
                                      decoration:const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/eng bf.png"),
                                          fit:BoxFit.fill,
                                          opacity:47,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width-30)/2,
                                height: 80.0,
                                child: MaterialButton(
                                  child:const Text('Get a english breakfast with 8000 coin' ,style: TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () {  },),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {},
                                    child: Container(
                                      decoration:const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/club sandwish.jpg"),
                                          fit:BoxFit.fill,
                                          opacity:47,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width-30)/2,
                                height: 80.0,
                                child: MaterialButton(
                                  child: const Text('Get a club sandwish with 2000 coin' ,style: TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () {  },),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}