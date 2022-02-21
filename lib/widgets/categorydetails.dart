import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class categirydetail extends StatefulWidget {
  String title;

  categirydetail({Key? key,required this.title}) : super(key: key);

  @override
  createState(){
    return MyAppState(title2: title);
  }
}

class MyAppState extends State<categirydetail> {
  String title2;
  MyAppState({Key? key, required this.title2}) : super();


  List list = [];
  CollectionReference bff = FirebaseFirestore.instance.collection("menu");
  List <int> count = [];
  List <num> tprice = [];
  //List <String> t = [];

  getData() async {
    QuerySnapshot dbf = await bff.where("type",isEqualTo: title2).get();
    dbf.docs.forEach((element) {
      setState(() {
        list.add(element.data());
        count.add(1);
        tprice.add(element.get('price'));
        //t.add((element.get('price')).toString());

      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void _increase(int n) {
    setState(() {
      count[n]++;
    });
    tprice[n] = count[n] * double.parse((list[n]['price']).toString());
    //t[n] = tprice[n].toStringAsFixed(2);
  }

  void _decrease(int n) {
    if (count[n] < 2) {
      return;
    }
    setState(() {
      count[n]--;
    });
    tprice[n] = tprice[n] - list[n]['price'];
    //t[n] = tprice[n].toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title2, style: const TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              for(int i = 0; i < list.length; i++)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side:const BorderSide(color: Colors.black, width: 2),
                  ),
                  child: SingleChildScrollView(
                    physics:const  BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 175,
                          width: 600,
                          child: Image(
                            image: NetworkImage(list[i]['imagepath']),
                          ),
                        ),
                        ExpansionTile(
                            collapsedIconColor: Colors.black,
                            iconColor: Colors.black,
                            childrenPadding:const  EdgeInsets.all(16).copyWith(
                                top: 0),
                            title: Text(
                                list[i]['name'], style: const TextStyle(color: Colors
                                .black, fontSize: 25, fontWeight: FontWeight
                                .bold)
                            ),
                            children: [
                              Text(list[i]['component'], style:const  TextStyle(
                                  color: Colors.black, fontSize: 20)),
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text('Price | ${tprice[i]} LE.',
                                    style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                              ),

                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
            ],
          )
      ),
    );
  }
}