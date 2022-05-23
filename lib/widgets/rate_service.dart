import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/backWithOpacity.dart';
import 'package:resflutter_app/widgets/widgeto.dart';

import 'home.dart';
class Rateus extends StatefulWidget{
  String userId;
  Rateus({Key? key, required this.userId,}) : super(key: key);

  @override
  State<Rateus> createState() => _MRateus();
}
class _MRateus extends State<Rateus>{
  Map<String, int> rateValues={
    'food': -1,
    'services':-1 ,
    'place':-1,
    'price':-1,

  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(rateValues);
    double wightOfButton=MediaQuery.of(context).size.width/5;
    return Stack(
        children: [
          BackWithOpacity(),
          Scaffold(
            appBar: AppBar(
              title:const  Text('Rate your visit',
                style: TextStyle(color: Colors.white,fontSize:22),
              ),
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            body: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Stack (
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Form(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget> [
                                  const SizedBox(height: 20),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Food quality: ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  //Rate for food quality
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                          rateValues['food'] = 1,
                                          print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['food'] = 2,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['food'] = 3,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['food'] = 4,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['food'] = 5,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 5 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 25.0,),

                                  const Text('Service: ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['services'] = 1,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['services'] = 2,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['services'] = 3,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          color:const Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['services'] = 4,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          color:const Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width:wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['services'] = 5,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                              side: const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 5 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 25.0,),

                                  const Text('Place: ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['place'] = 1,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height:wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['place'] = 2,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['place'] = 3,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['place'] = 4,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['place'] = 5,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 5 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 25.0,),

                                  const Text('Price: ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['price'] = 1,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side:const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['price'] = 2,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side:const BorderSide(color: Colors.grey)
                                          ),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width:wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['price'] = 3,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['price'] = 4,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: wightOfButton-20,
                                        width: wightOfButton,
                                        child:
                                        MaterialButton(
                                          onPressed:()=> {
                                            rateValues['price'] = 5,
                                            print(rateValues),
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side:const BorderSide(color: Colors.grey),
                                          ),
                                          child:const Text(' 5 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 30.0,),
                                  SizedBox(
                                    height: wightOfButton-20,
                                    width:(MediaQuery.of(context).size.width)-100,
                                    child: MaterialButton(
                                      onPressed: () => {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      color:const Color.fromRGBO(65, 189, 180, 54),
                                      child:const Text(' Done ',
                                        style:TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ]
            ),
          ),
        ]
    );
  }
/*

'food': 0,
'services':0 ,
'place':0,
'price':0,

 */
  collectRate(int id, int num) {

  }
  saveTheRate(){

  }
}