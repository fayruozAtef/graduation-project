import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/categories.dart';
import 'package:resflutter_app/widgets/catgoriesinhall.dart';


class detailsinHall extends StatefulWidget {
  String title;
  String table;
  String userid;

  detailsinHall({Key? key,required this.title, required this.table, required this.userid}) : super(key: key);

  @override
  createState(){
    return MyAppState(title2: title, tableNo: this.table , id: userid);
  }
}

class MyAppState extends State<detailsinHall> {
  String title2;
  String tableNo;
  String id;
  MyAppState({Key? key, required this.title2, required this.tableNo,required this.id}) : super();


  List <List<String>>order=[];
  List list = [];
  CollectionReference bff = FirebaseFirestore.instance.collection("menu");
  List <int> count = [];
  List <num> tprice = [];
  //List <String> t = [];

  getData() async {
    QuerySnapshot dbf = await bff.where('type',isEqualTo:title2).get();
    dbf.docs.forEach((element) {
      setState(() {
        list.add(element.data());
        count.add(0);
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

  }

  void _decrease(int n) {
    if (count[n] < 1) {
      return;
    }
    setState(() {
      count[n]--;
    });
    tprice[n] = tprice[n] - list[n]['price'];
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
                        width: 800,
                        child: Image(
                          image:NetworkImage(list[i]['imagepath']),
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
                            width:225,
                            height: 40 ,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.black,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                            ),
                            child:Text(count[i]==0? '0':'${tprice[i]} LE',textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 45,),
            /*Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.teal),
                    fixedSize:MaterialStateProperty.all(Size(150,45)),
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(18)
                    ))
                ),
                onPressed: () {
                  for(int i=0;i<list.length;i++){
                    if(count[i]>0){
                      List<String> su=[];
                      su.add(list[i]['name']);
                      su.add(count[i].toString());
                      su.add(tprice[i].toString());
                      order.add(su);
                    }
                  }
                  print(order);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CategoriesinHall(subOrder:order, tableno: tableNo,userid: id,)));
                },

                child: Text('Add',style:TextStyle(fontSize: 30)),
              ),
            ),*/
          ],
        ),
      ),
      floatingActionButton: buildNavigateButton(),
    );
  }
  Widget buildNavigateButton()=>FloatingActionButton.extended(
    backgroundColor: Colors.teal,
    onPressed: (){
      for(int i=0;i<list.length;i++){
        if(count[i]>0){
          List<String> su=[];
          su.add(list[i]['name']);
          su.add(count[i].toString());
          su.add(tprice[i].toString());
          order.add(su);
        }
        List<String> subend=['','','0'];
        order.add(subend);
      }
      print(order);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CategoriesinHall(subOrder:order, tableno: tableNo,userid: id,)));

    },
    label: Text('Add',style:TextStyle(fontSize: 30)),
  );
}