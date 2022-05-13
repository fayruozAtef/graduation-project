import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:resflutter_app/widgets/widgeto.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'catgoriesinhall.dart';

class QRScanPage extends StatefulWidget {
  String userid;
  QRScanPage({Key? key, required this.userid}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScanPageState(id: userid);
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = '';
  String tableno = '';
  String code='';
  List<List<String>>test=[];
  String id;
  _QRScanPageState({Key? key, required this.id});

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return  Stack(
      children: [
        const BackWithOpacity(),
        Scaffold(
          appBar:AppBar(
            title:const Text('Choose the table',style: TextStyle(color: Colors.white,fontSize:22)),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child:Container(
              padding: EdgeInsets.all(20.0),
              child: Column (
                children: <Widget>[
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Table number is: ' + ' $qrCode',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 280,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height:60,
                      width:300,
                      child: MaterialButton(
                        onPressed: () =>{ qrCode="",scanQRCode()},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color:const Color.fromRGBO(65, 189, 180, 54),
                        child:const Text('Scan QR-code',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    height:60,
                    width:180,
                    child: MaterialButton(
                      onPressed: (){
                              if(qrCode==''){
                                showAlertDialog(context,"Scan table QR-code first.");
                              }
                              else if(double.parse(qrCode)<0){
                                showAlertDialog(context,"Scan table QR-code first.");
                              }
                              else{
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => CategoriesinHall(totalOrder:test, tableno: qrCode,userid: id,))
                                );
                              }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color:const Color.fromRGBO(65, 189, 180, 54),
                      child:const Text(' Done ',
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.code=qrCode;
        getTableNumber();
      });
    } on PlatformException {
      code = 'Failed to get platform version.';
    }
  }

  CollectionReference tables = FirebaseFirestore.instance.collection("tables");
  CollectionReference reservedTabesToday = FirebaseFirestore.instance.collection("reserve");

  //Get table number of the current code
  Future<void> getTableNumber() async {
    int tablesNumber=0;
    QuerySnapshot tableQuery = await tables.where("qrcode",isEqualTo: code).get();
    tablesNumber=tableQuery.size;
    if(tablesNumber==1){
      tableQuery.docs.forEach((element) {
        setState(() {
         tableno=element.id;
         print(tableno);
        });
      });
    }
    else {
      print("No thing to Scan");
      showAlertDialog(context,"Scan table QR-code first.");
    }
    getReserved();
  }

  //Get all reserved tables today
  Future<void> getReserved() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateToday = formatter.format(now);
    TimeOfDay time=TimeOfDay.now();
    bool flag=true;
    QuerySnapshot dbt = await reservedTabesToday.where("arrived", isEqualTo: false).where('date',isEqualTo:dateToday ).get();
    dbt.docs.forEach((element) {
      setState(() {
        if(tableno==element.get("tableno").toString()){
          if(element.get('date')==DateFormat('yyy-MM-dd').format(now)){
            TimeOfDay t=TimeOfDay(hour:int.parse((element.get('time')).split(":")[0]),minute: int.parse((element.get('time')).split(":")[1]));
            if(time.hour>((t.hour)-4)){
              flag=false;
            }
          }
        }
      });
    });
    if(flag==true) {
      qrCode=tableno;
    }
    else{
      qrCode="";
      showAlertDialog(context, "Sorry the table is reserved today. \nPlease go and scan another table. \nThanks for your help");
    }
}
  showAlertDialog(BuildContext context,String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white54,
      title:const Text("Warning:", style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,
      ),),
      content: Text(message, style: const TextStyle(
        fontSize: 20, color: Colors.black,
      ),),
      actions: [],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}