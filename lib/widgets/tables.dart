import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

    int n1=3;
    int n2=5;
@override
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
  return SingleChildScrollView(
      child: Container(
    height:MediaQuery.of(context).size.height*0.75,
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
    child: Text("Sets no:${widget.no}  location:in door",style:TextStyle(color:Colors.black,fontSize: 25))
    ),
    SizedBox(height:10),
    ElevatedButton(
    style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.greenAccent),
    fixedSize:MaterialStateProperty.all(Size(100,35)),
    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius:BorderRadius.circular(18)
    ))
    ),
    onPressed: () {
    setState((){
    int tablen=n1;
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=>confirm(date:widget.date,
    time:widget.time,
    tableno:tablen,),
    ),
    );
    });
    },
    child: const Text('OK',style:TextStyle(fontSize: 24)),
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
    style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.greenAccent),
    fixedSize:MaterialStateProperty.all(Size(150,45)),
    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius:BorderRadius.circular(18)
    ))
    ),
    onPressed: () {
    setState((){
    int tablen=n2;
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=>confirm(date:widget.date,
    time:widget.time,
    tableno:tablen,),
    ),
    );
    });
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
    ),
    ),
    ),
  );
  },
  );
  }
  ),
  ],
    );

  }
      )
  );

  }

}