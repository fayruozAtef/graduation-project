import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resflutter_app/widgets/confirmation.dart';

List<String> list = [
  'assets/images/table1.jpg',
  'assets/images/table1_2.jpg',
];

List<String> list2 = [
  'assets/images/table2.jpg',
  'assets/images/table2_2.jpg',
];


// ignore: must_be_immutable
class tables extends StatefulWidget {
  final String date;
  final String time;
  final int no;


  tables({Key? key,required this.date,required this.time,required this.no}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _tables();

}


  class _tables extends State<tables> {

    List table = [];
    CollectionReference t = FirebaseFirestore.instance.collection("tables");

    getData() async {
      QuerySnapshot dbt = await t.get();
      dbt.docs.forEach((element) {
        setState(() {
          table.add(element.data());
        });
      });
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    int n1=1;
    int n2=3;
@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:AppBar(
      title: Text('Available tables',style: TextStyle(color: Colors.black,fontSize:25)),
      backgroundColor: Colors.white,
      foregroundColor:Colors.black,
    ),
    body:Builder(
      builder: (context) {
        return ListView(
          padding:EdgeInsets.all(20) ,
            children:[
              Column(
                children:[
                  for(int i = 0; i < table.length; i=i+2)
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors
                                  .white,
                                side: BorderSide(width: 3, color: Colors.black),
                                fixedSize: Size(100, 100),
                                shape: CircleBorder(),
                              ),
                              child: Text('${table[i]['num']}', style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold)),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    //final theme = Theme.of(context);
                                    return SingleChildScrollView(
                                      child: Container(
                                          height: 500,
                                          child: Container(
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: CarouselSlider(
                                                        options: CarouselOptions(
                                                          aspectRatio: 1.4,
                                                        ),
                                                        items: list
                                                            .map((item) =>
                                                            Container(
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      item)),
                                                            ))
                                                            .toList(),
                                                      )
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                          "Sets no:${table[i]['no-of-sets'] } location:${table[i]['location'] }",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 25))
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty
                                                            .all<Color>(
                                                            Colors.teal),
                                                        fixedSize: MaterialStateProperty
                                                            .all(Size(150, 45)),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                            RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(18)
                                                            ))
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              confirm(date: widget
                                                                  .date,
                                                                  time: widget
                                                                      .time,
                                                                  tableno: table[i]['num']),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('OK',
                                                        style: TextStyle(
                                                            fontSize: 30)),
                                                  ),
                                                ]
                                            ),
                                          )
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            if(i < table.length - 1)
                              SizedBox(width: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors
                                  .white,
                                side: BorderSide(width: 3, color: Colors.black),
                                fixedSize: Size(100, 100),
                                shape: CircleBorder(),
                              ),
                              child: Text('${table[i + 1]['num']}',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    //final theme = Theme.of(context);
                                    return SingleChildScrollView(
                                      child: Container(
                                          height: 500,
                                          child: Container(
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: CarouselSlider(
                                                        options: CarouselOptions(
                                                          aspectRatio: 1.4,
                                                        ),
                                                        items: list
                                                            .map((item) =>
                                                            Container(
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      item)),
                                                            ))
                                                            .toList(),
                                                      )
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                          "Sets no:${table[i +
                                                              1]['no-of-sets'] } location:${table[i +
                                                              1]['location'] }",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 25))
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty
                                                            .all<Color>(
                                                            Colors.teal),
                                                        fixedSize: MaterialStateProperty
                                                            .all(Size(150, 45)),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                            RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(18)
                                                            ))
                                                    ),
                                                    onPressed: () {
                                                      //int tablen=n1;
                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              confirm(date: widget
                                                                  .date,
                                                                  time: widget
                                                                      .time,
                                                                  tableno: table[i +
                                                                      1]['num']),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('OK',
                                                        style: TextStyle(
                                                            fontSize: 30)),
                                                  ),
                                                ]
                                            ),
                                          )
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ]
                      ),
                    ),

                ]
            ),
            ]
        );
      },
    ),
  );
  }
}