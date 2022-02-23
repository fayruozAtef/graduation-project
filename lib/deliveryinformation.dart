import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resflutter_app/categories.dart';
import 'package:resflutter_app/widgets/backWithOpacity.dart';

List<String>test=[' ',' ','0'];
class DeliveryInformation extends StatefulWidget {

  final String userId;

  const DeliveryInformation({Key? key,required this.userId}) : super(key: key);

  @override
  _DeliveryInformationState createState() => _DeliveryInformationState(userId: userId);
}

class _DeliveryInformationState extends State<DeliveryInformation> {
  String address='';
  String phonenum='';
  String extraphonenum='';

  final String userId;
   _DeliveryInformationState({Key? key,required this.userId}) ;

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    myController3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackWithOpacity(),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:Column(
                  children:  [
                    const SizedBox(height: 10.0,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Address: ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60.0,
                      width:  MediaQuery.of(context).size.width,
                      child: TextField(
                        maxLength: 11,

                        controller: myController,
                        textAlign: TextAlign.left,
                        style:const TextStyle(color: Colors.white, fontSize: 20.0,),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.white, width: 4.0),
                          ),

                        ),

                      ),
                    ),

                    const SizedBox(height: 30.0,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Phone: ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60.0,
                      width:  MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: myController2,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        style:const TextStyle(color: Colors.white, fontSize: 20.0,),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.white, width: 4.0),
                          ),

                        ),

                      ),
                    ),


                    const SizedBox(height: 30.0,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Extra Phone: ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60.0,
                      width:  MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: myController3,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        style:const TextStyle(color: Colors.white, fontSize: 20.0,),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.white, width: 4.0),
                          ),

                        ),
                    ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 60.0,
                        child: RaisedButton(
                          child: const Text('Done',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26, color:Colors.white,
                            ),
                          ),
                          color: const Color.fromRGBO(65, 189, 180, 54),
                          shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(12.0),
                          ),
                          onPressed: () {
                            address=myController.text;
                            phonenum = myController2.text;
                            extraphonenum=myController3.text;
                            if(address==''){
                              showAlertDialog(context, 'Address is required');
                            }
                            else if(phonenum==''){
                              showAlertDialog(context, 'Phone number is required');
                            }
                            else{
                              if(phonenum.length!=11) {
                                showAlertDialog(context, 'Phone number is not valid ');

                              }
                              else if(extraphonenum.length!=0 && extraphonenum.length!=11) {
                                showAlertDialog(context, 'Extra phone number is not valid');
                              }
                              else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute
                                      (builder: (context) =>
                                        Categories(
                                            subOrder: test,
                                            address: address,
                                            phone: phonenum,
                                            exphone: extraphonenum,
                                            userId: userId)));
                              }
                            }

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        )
      ]
    );
  }

  showAlertDialog(BuildContext context, String errormessage) {

    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(
      backgroundColor: Colors.black,
      title:const Text("Warning:", style: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white,
      ),),
      content: Text('$errormessage', style:const  TextStyle(
        fontSize: 20, color: Colors.white,
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
