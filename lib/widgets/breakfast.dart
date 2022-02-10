import 'package:flutter/material.dart';


class breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _breakfast();
  }
}
class _breakfast extends StatefulWidget {
  const _breakfast({Key? key}) : super(key: key);

  @override
  createState(){
    return MyAppState();
  }
}

class MyAppState extends State<_breakfast> {

  int _count =1;
  double tprice=49.99,_price=49.99;
  var t='49.99';


  void _increase(){
    setState(() {
      _count++;
    });
    tprice= _count*_price ;
    t=tprice.toStringAsFixed(2);
  }

  void _decrease(){
    if(_count<2){
      return;
    }
    setState(() {
      _count--;
    });
    tprice=tprice-_price;
    t=tprice.toStringAsFixed(2);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Breakfast',style: TextStyle(color: Colors.black,fontSize:25)),
        backgroundColor: Colors.white,
        foregroundColor:Colors.black,
      ),
      body:SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height:10),
              Card(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(13.0),
                  side:BorderSide(color:Colors.black,width:2),
                ),
                child:SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height:175,
                        width:600,
                        child: Image(
                          image: AssetImage("assets/eng bf.png"),
                        ),
                      ),
                      ExpansionTile(
                          collapsedIconColor: Colors.black,
                          iconColor: Colors.black,
                          childrenPadding:EdgeInsets.all(16).copyWith(top:0),
                          title: Text(
                              'English Breakfast',style:TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)
                          ),
                          children:[
                            Text('Omelette+Hotdog+Toast+Jam+Butter',style:TextStyle(color:Colors.black,fontSize: 20)),

                          ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            child:Icon(Icons.add,color:Colors.white,size:20),
                            onPressed: _increase,
                            backgroundColor:Colors.teal,
                            mini:true,
                          ),
                          Text('${_count}',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                          FloatingActionButton(
                            child:Icon(Icons.remove,color:Colors.white),
                            onPressed: _decrease,
                            backgroundColor:Colors.teal,
                            mini:true,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child:ElevatedButton(
                              style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
                                  fixedSize:MaterialStateProperty.all(Size(200,40)),
                                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(18)
                                  ))
                              ),
                              onPressed: () {
                                /*Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => ));*/
                              },
                              child:Text('ADD | ${t} LE',style:TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:10),
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