
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'backgrconfirm.dart';
import 'background.dart';
import 'home.dart';
class confirmDone extends StatefulWidget {
  final String date;
  final String time;
  final int tableno;
  final String userId;
  confirmDone({Key? key, required this.date,required this.time,required this.tableno,required this.userId}) : super(key: key);
  @override
  State<confirmDone> createState() => _confirm();
}

class _confirm extends State<confirmDone> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Backconfirm(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 40),),
              Container(
                padding: EdgeInsets.all(15.5),
                child: const Text('Your Reservation is Done:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),) ,
              ),
              Padding(padding: EdgeInsets.only(top: 30),),
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                      child:const Text('Date: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5,10.0,0,5),
                      child: Text(widget.date,
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                      child:const Text('Time: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5,10.0,0,5),
                      child: Text(widget.time,
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                      child: const Text('Table no: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0,10.0,0,5),
                      child: Text('${widget.tableno}',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),),

              Container(
                height: 120,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.white12,width: 10.0,)
                ),
                child: Center(
                  child: ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      child:const Text('Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),),
                      color: Color.fromRGBO(65, 189, 180, 54),

                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(12.0),
                      ),
                      onPressed: () async {

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>home(userId: widget.userId,)));
                      },

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

