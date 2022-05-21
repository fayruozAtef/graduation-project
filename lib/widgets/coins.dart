import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    super.initState();
  }
  List<int> value=[400,600,1000,1500,3200,4500];
  List<String> rewards=["softdrink","latte","fries","pancake","english breakfast","club sandwish"];
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
                                    child:InkWell(onTap: () {getReward(0);},
                                      child: Container(
                                        decoration:const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/fresh-cola-drink-glass.jpg"),
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
                                    child: Text('Get a softdrink with ${value[0]} coin' ,style:const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                    onPressed: () { getReward(0); },),
                                ),
                              ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {getReward(1);},
                                    child: Container(
                                      decoration:const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/latte-coffee.jpg"),
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
                                  child: Text('Get a latte with ${value[1] } coin' ,style:const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () { getReward(1); },),
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
                                  child:InkWell(onTap: () {getReward(2);},
                                    child: Container(
                                      decoration:const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/french-fries.jpg"),
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
                                  child: Text('Get a fries with ${value[2]} coin' ,style: const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () { getReward(2); },),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {getReward(3);},
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
                                  child: Text('Get a pancake with ${value[3]} coin' ,style:const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () { getReward(3);},),
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
                                  child:InkWell(onTap: () {getReward(4);},
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
                                  child: Text('Get a english breakfast with ${value[4]} coin' ,style:const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () { getReward(4); },),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:170,
                                width: (MediaQuery.of(context).size.width-30)/2,
                                child:Card(
                                  child:InkWell(onTap: () {getReward(5);},
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
                                  child: Text('Get a club sandwish with ${value[5]} coin' ,style:const TextStyle(fontSize: 18, color: Colors.white,),textAlign: TextAlign.center,),
                                  onPressed: () { getReward(5); },),
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
  getReward( int index){

      if(coin<value[index]) {
        showAlertDialog(context, "Sorry, your coins isn't sufficent. \nMake orders to get more coins. \nThanks.");
      }
      else if(coin>value[index]){
        confirmMessage(context,"Do you want to get ${rewards[index]} as a reward? ", index);
      }
  }
  showAlertDialog(BuildContext context,String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title:const Text("Message:", style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,
      ),),
      content: Text(message, style: const TextStyle(
        fontSize: 20, color: Colors.black,
      ),),
      actions: [],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  confirmMessage(BuildContext context,String message, int index) {

    Widget cancelButton = FlatButton(
      child:const Text("Yes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      onPressed:  () async {
        String userId=FirebaseAuth.instance.currentUser!.uid;
        CollectionReference rewardTable = FirebaseFirestore.instance.collection("Rewards");
        QuerySnapshot sp=await rewardTable.get();
        bool hasreward=false;
        sp.docs.forEach((element) {
          if(element["userId"]==userId && element["get"]==false){
            hasreward=true;
          }
        });
        if(hasreward==false){
          await rewardTable.doc().set({'userId':userId,"reward type":rewards[index],"get":false ,"coins":value[index]})
              .then((value)=> {
            Navigator.pop(context, false),
            showAlertDialog(context, "Go to the waiter for your reward.")
          }
          ).catchError((error) => print("Failed to get reward: $error"));
        }
        else{
          Navigator.pop(context, false);
          showAlertDialog(context, "Sorry get your suspended reward first. ");
        }
      },
    );
    Widget continueButton = FlatButton(
      child: const Text("No",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      onPressed:  () {
        Navigator.pop(context, false);

      },
    );

    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(
      backgroundColor: Colors.white,
      title:const Text("Message:", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,
      ),),
      content: Text('$message', style: const TextStyle(
        fontSize: 18, color: Colors.black,
      ),),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}