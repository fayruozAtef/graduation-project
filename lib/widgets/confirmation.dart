
import 'package:flutter/material.dart';
import 'background.dart';
class confirm extends StatefulWidget {
  final String date;
  final String time;
  final int tableno;
  confirm({Key? key, required this.date,required this.time,required this.tableno}) : super(key: key);
  @override
  State<confirm> createState() => _confirm();
}

class _confirm extends State<confirm> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,

      ),

      body:Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.only(top: 30),),
              Container(
                child: Center(
                  child: Text('Your Reservation:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50),),
              Container(
                height: 50,
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
                      child: Text('',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
                      child: Text('Hint: ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Flexible(
                      child: Text('you cannot cancel it before the time by 2 hours.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                    )
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
                      child: Text('Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),),
                      color: Color.fromRGBO(65, 189, 180, 54),

                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(12.0),
                      ),
                      onPressed: () {},

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

