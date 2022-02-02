import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(tables());
}



List<String> list = ['assets/images/table1.jpg',
  'assets/images/table1_2',
];

List<String> list2 = [
  'assets/images/table2.jpg',
  'assets/images/table2_2',
];


class tables extends StatelessWidget {
  const tables({Key? key}) : super(key: key);

  final String date;
  final String time;
  final int tableno;
  int n1=3;
  int n2=5;
  tables({Key? key,required this.date,required this.time}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Available Tables',style: TextStyle(color: Colors.black,fontSize:25)),
        backgroundColor: Colors.white,
        foregroundColor:Colors.black,
      ),
      body:Builder(
        builder: (context) {
          return ListView(
              children:[ SizedBox(height: 20),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(primary: Colors.white,
                      side:BorderSide(width:3,color:Colors.black),
                      fixedSize:Size(100,100),
                      shape:CircleBorder()
                  ),
                  child: Text('3',style:TextStyle(color:Colors.black,fontSize: 50,fontWeight: FontWeight.bold)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        final theme = Theme.of(context);
                        return Container(
                            height:500,
                            child:Container(
                              child:Column(
                                  children:[
                                    Container(
                                        child: CarouselSlider(
                                          options: CarouselOptions(aspectRatio: 1.4,
                                          ),
                                          items: list
                                              .map((item) => Container(
                                            child: Center(child: Image.asset(item)),
                                          ))
                                              .toList(),
                                        )
                                    ),
                                    SizedBox(height:20),
                                    SizedBox(
                                        width: 200,
                                        child: Text("Sets no:4  location:in door",style:TextStyle(color:Colors.black,fontSize: 25))
                                    ),
                                    SizedBox(height:20),
                                    ElevatedButton(
                                      style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(ColorfromRGBO(65,189,180,54)),
                                          fixedSize:MaterialStateProperty.all(Size(150,45)),
                                          shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                              borderRadius:BorderRadius.circular(18)
                                          ))
                                      ),
                                      onPressed: () {
                                        setState((){
                                          tableno=n1;
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>confirm(date:this.date,
                    time:this.time,
                    tableno:this.tableno,)));
                    }
    })
    }
    },
                                      child: Text('OK',style:TextStyle(fontSize: 30)),
                                    ),
    SizedBox(height: 20),
    ElevatedButton(
    style:ElevatedButton.styleFrom(primary: Colors.white,
    side:BorderSide(width:3,color:Colors.black),
    fixedSize:Size(100,100),
    shape:CircleBorder()
    ),
    child: Text('5',style:TextStyle(color:Colors.black,fontSize: 50,fontWeight: FontWeight.bold)),
    onPressed: () {
    showModalBottomSheet(
    context: context,
    builder: (context) {
    final theme = Theme.of(context);
    return Container(
    height:500,
    child:Container(
    child:Column(
    children:[
    Container(
    child: CarouselSlider(
    options: CarouselOptions(aspectRatio: 1.4,
    ),
    items: list2
        .map((item) => Container(
    child: Center(child: Image.asset(item)),
    ))
        .toList(),
    )
    ),
    SizedBox(height:20),
    SizedBox(
    width: 200,
    child: Text("Sets no:4  location:in door",style:TextStyle(color:Colors.black,fontSize: 25))
    ),
    SizedBox(height:20),
    ElevatedButton(
    style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(ColorfromRGBO(65,189,180,54)),
    fixedSize:MaterialStateProperty.all(Size(150,45)),
    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius:BorderRadius.circular(18)
    ))
    ),
    onPressed: () {
      setState((){
        tableno=n2;
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>confirm(date:this.date,
        time:this.time,
        tableno:this.tableno,)));
      }
    },
    child: Text('OK',style:TextStyle(fontSize: 30)),
    ),
                                  ]
                              ),
                            )
                        );

                      },
                    );
                  },
                ),
              ]
          );
        },
      ),
    );
  }
}