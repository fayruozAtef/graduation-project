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
            title: Text('Choose the table',style: TextStyle(color: Colors.white,fontSize:22)),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Column (
              children: <Widget>[
                const SizedBox(height: 80),
                Text(
                  'Table number is: ' + ' $qrCode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 250,width: 80),
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,width: 80),
                SizedBox(
                  height:70,
                  width:200,
                  child: MaterialButton(
                    onPressed: () => scanQRCode(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color:Color.fromRGBO(65, 189, 180, 54),

                    child:const Text(' Done ',
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
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