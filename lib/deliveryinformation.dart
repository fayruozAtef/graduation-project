import 'package:flutter/material.dart';
import 'package:resflutter_app/categories.dart';
import 'package:resflutter_app/widgets/backWithOpacity.dart';

class DeliveryInformation extends StatefulWidget {
  const DeliveryInformation({Key? key}) : super(key: key);

  @override
  _DeliveryInformationState createState() => _DeliveryInformationState();
}

class _DeliveryInformationState extends State<DeliveryInformation> {
  String address='';
  String phonenum='';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackWithOpacity(),
        Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Fill your information' ,
            style: TextStyle(color: Colors.white, fontSize: 23,
              fontWeight: FontWeight.bold,
            )
        ),
        backgroundColor: Colors.black,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12.0),
              Align(
                  alignment: Alignment.topLeft,
                  child:
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:const Text('Address: ', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  )
              ),
              const SizedBox(height: 10.0),

              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.streetAddress,
                validator: (value){
                 if(value!.isEmpty)
                   {
                     showAlertDialog(context,0);
                     address=value;
                   }

                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),

              ),
              /*TextField(
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)

                  )
                ),
                r
              ),*/
              const SizedBox(height: 10.0),
              Align(
                  alignment: Alignment.topLeft,
                  child:
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:const Text('Phone number : ', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  )
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                //decoration: InputDecoration(labelText: 'F-name' ,labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                validator: (value){
                  if(value!.isEmpty)
                  {
                    showAlertDialog(context,1);
                    phonenum=value;
                  }


                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),

              ),
              const SizedBox(height: 10.0),
              Align(
                  alignment: Alignment.topLeft,
                  child:
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:const Text('Extra phone : ', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  )
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                //decoration: InputDecoration(labelText: 'F-name' ,labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),

              ),
              const SizedBox(height: 50.0,),
              Center(
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: const Text('Done',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),),
                    color: const Color.fromRGBO(65, 189, 180, 54),

                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(12.0),
                    ),
                    onPressed: () {
                      if (address.isEmpty) {
                        showAlertDialog(context, 0);
                      }
                      else if(phonenum.isEmpty){
                        showAlertDialog(context, 1);
                      }
                      else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categories()));
                      }
                    },

                  ),
                ),
              ),
              ],
          ),
        ),
      ),
    )
      ],
    );
  }
  showAlertDialog(BuildContext context, int num) {

    String errormessage='';

    if(num==0){
      errormessage="Enter Address";}
    else if(num==1){
      errormessage="Enter phone number";}

    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(
      backgroundColor: Colors.white54,
      title:const Text("Warning:", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
      ),),
      content: Text('$errormessage', style:const  TextStyle(
        fontSize: 18, color: Colors.black,
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
