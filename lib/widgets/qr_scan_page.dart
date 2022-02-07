import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:resflutter_app/widgets/widgets.dart';

class QRScanPage extends StatefulWidget {
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
            title: Text('Choose the table',style: TextStyle(color: Colors.white,fontSize:25)),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Column (
              children: <Widget>[
                Back(),
                const SizedBox(height: 35,),
                const Text(
                  'Table number is',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width:10),
                Text(
                  '$qrCode',
                  style:const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 200),
                SizedBox(
                  height:70,
                  width:230,
                  child: MaterialButton(
                    onPressed: () => scanQRCode(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color:Color.fromRGBO(65, 189, 180, 54),
                    child:const Text('Scan QR-code',
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ) ,

                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
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