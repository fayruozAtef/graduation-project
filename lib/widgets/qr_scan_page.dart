// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resflutter_app/widgets/rate_service.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = '--';

  @override
  Widget build(BuildContext context) {
    final deviceSize= MediaQuery.of(context).size;
    return  Stack(
      children: [
        Back(),
        Scaffold(
          appBar:AppBar(
            title: Text('Choose the table',style: TextStyle(color: Colors.white,fontSize:22)),
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
                      style: TextStyle(
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
                        onPressed: () => scanQRCode(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color:Color.fromRGBO(65, 189, 180, 54),
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
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Rateus(),
                      )),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color:Color.fromRGBO(65, 189, 180, 54),
                      child:const Text(' Done ',
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
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
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}