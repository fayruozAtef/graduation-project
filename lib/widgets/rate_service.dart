import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resflutter_app/widgets/widgets.dart';

import 'home.dart';


int n1=0,n2=0,n3=0,n4=0,n5=0;
class Rateus extends StatefulWidget{
  @override
  State<Rateus> createState() => _MRateus();
}
class _MRateus extends State<Rateus>{
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Back(),
          Scaffold(
            appBar: AppBar(
              title: Text('Rate your visit',
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
                                  const Text('Food quality: ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(1,1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Colors.black,
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(1,2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(1,3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(1,4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(1,5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
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
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(2,1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Colors.black,
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(2,2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(2,3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(2,4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(2,5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
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
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(3,1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Colors.black,
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(3,2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(3,3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(3,4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(3,5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
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
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(4,1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side: BorderSide(color: Colors.grey)
                                          ),
                                          color:Colors.black,
                                          child:const Text(' 1 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(4,2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side: BorderSide(color: Colors.grey)
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 2 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(4,3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 3 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(4,4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
                                          child:const Text(' 4 ',
                                            style:TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 60.0,
                                        width: 80.0,
                                        child:
                                        MaterialButton(onPressed: collectRate(4,5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            side: BorderSide(color: Colors.grey),
                                          ),
                                          color:Color.fromRGBO(65, 189, 180, 54),
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
                                    height: 60.0,
                                    width: 300.0,
                                    child: MaterialButton(
                                      onPressed: () => Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>home())),

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

  collectRate(int id, int num) {
    if(id==1)
      n1=num;
    else if(id==2)
      n2=num;
    else if(id==3)
      n3=num;
    else if(id==4)
      n4=num;
    else if(id==5)
      n5=num;
  }

}