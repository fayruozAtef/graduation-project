
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Confirm2.dart';
import 'background.dart';
import 'home.dart';
class confirm extends StatefulWidget {
  final String date;
  final String time;
  final int tableno;
  final String userId;
  confirm({Key? key, required this.date,required this.time,required this.tableno,required this.userId}) : super(key: key);
  @override
  State<confirm> createState() => _confirm();
}

class _confirm extends State<confirm> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text('Your Reservation:',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),) ,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),

      body:Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                      child: Text('Date: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,10.0,0,5),
                      child: Text(widget.date,
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                      child: Text('Time: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,10.0,0,5),
                      child: Text(widget.time,
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                      child: Text('Table no: ',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0,10.0,0,5),
                      child: Text('${widget.tableno}',
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: RichText(text: TextSpan(
                  text :'Hint : ',
                  style:TextStyle(color:Colors.red,fontSize: 25,fontWeight: FontWeight.bold),
                  children:[
                    TextSpan(text :"you can't cancel it before the time by 2 hours.",
                      style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                    maxLines: 3,
                    softWrap: false,
                    overflow:TextOverflow.ellipsis
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
                      child: Text('Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),),
                      color: Color.fromRGBO(65, 189, 180, 54),

                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(12.0),
                      ),
                      onPressed: () async {
                        CollectionReference data = FirebaseFirestore.instance.collection("reserve");
                        await data.doc().set(
                          {"arrived":false,"date":widget.date,"time":widget.time,"tableno":widget.tableno,"user id":widget.userId},
                          SetOptions(merge: true),
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>
                                confirmDone(date: widget.date, time: widget.time,tableno: widget.tableno,
                              userId: widget.userId,)));
                      },

                    ),
                  ),
                ),
              ),
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
                      child: Text('Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),),
                      color: Color.fromRGBO(65, 189, 180, 54),

                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(12.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>home(userId: widget.userId,)));
                      },

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

