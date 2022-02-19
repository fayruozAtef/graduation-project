import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/categories.dart';
import 'package:resflutter_app/widgets/catgoriesinhall.dart';


class detailsinHall extends StatefulWidget {
  String title;
  String table;
  detailsinHall({Key? key,required this.title, required this.table}) : super(key: key);

  @override
  createState(){
    return MyAppState(title2: title, tableNo: this.table);
  }
}

class MyAppState extends State<detailsinHall> {
  String title2;
  String tableNo;
  MyAppState({Key? key, required this.title2, required this.tableNo}) : super();

  List image = ["assets/images/eng bf.png",
    "assets/images/club sandwish.jpg",
    "assets/images/pancakes.jpg",
    "assets/images/eng bf.png",
    "assets/images/club sandwish.jpg",
    "assets/images/pancakes.jpg",
    "assets/images/pancakes.jpg",
  ];
  List <String>order=[];
  List list = [];
  CollectionReference bff = FirebaseFirestore.instance.collection("menu");
  List <int> count = [];
  List <num> tprice = [];
  List <String> t = [];

  getData() async {
    QuerySnapshot dbf = await bff.where('type',isEqualTo:title2).get();
    dbf.docs.forEach((element) {
      setState(() {
        list.add(element.data());
        count.add(1);
        tprice.add(element.get('price'));
        t.add((element.get('price')).toString());
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
    t[n] = tprice[n].toStringAsFixed(2);
  }

  void _decrease(int n) {
    if (count[n] < 2) {
      return;
    }
    setState(() {
      count[n]--;
    });
    tprice[n] = tprice[n] - list[n]['price'];
    t[n] = tprice[n].toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title2, style: TextStyle(color: Colors.black, fontSize: 25)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              for(int i = 0; i < list.length; i++)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 175,
                          width: 600,
                          child: Image(
                            image: AssetImage(image[i]),
                          ),
                        ),
                        ExpansionTile(
                            collapsedIconColor: Colors.black,
                            iconColor: Colors.black,
                            childrenPadding: EdgeInsets.all(16).copyWith(
                                top: 0),
                            title: Text(
                                list[i]['name'], style: TextStyle(color: Colors
                                .black, fontSize: 25, fontWeight: FontWeight
                                .bold)
                            ),
                            children: [
                              Text(list[i]['component'], style: TextStyle(
                                  color: Colors.black, fontSize: 20)),
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              child: Icon(Icons.add, color: Colors.white,
                                  size: 20),
                              onPressed: () {
                                _increase(i);
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                            ),
                            Text('${count[i]}', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                            FloatingActionButton(
                              child: Icon(Icons.remove, color: Colors.white, size: 20),
                              onPressed: () {
                                _decrease(i);
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.white),
                                    fixedSize: MaterialStateProperty.all(Size(200, 40)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18)
                                    ))
                                ),
                                onPressed: () {
                                  order.add(list[i]['name']);
                                  order.add(count[i].toString());
                                  order.add(t[i]);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => CategoriesinHall(subOrder:order, tableno: tableNo,)));
                                },
                                child:
                                Text('ADD | ${t[i]} LE',
                                    style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            )
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