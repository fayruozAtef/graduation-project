import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'home.dart';

class profileInfo extends StatefulWidget {

  final String uid;
  profileInfo({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>information(userId:uid);

}

class information extends State<profileInfo> {

  final formkey=GlobalKey<FormState>();
  final String userId;
  information({Key? key,required this.userId});


  Future updateData(String fname,String lname,String phone,String gender,String image) async{
    CollectionReference db = FirebaseFirestore.instance.collection("users");
    return await db.doc(userId).set({"first name":fname,"last name":lname,"phone":phone,"Gender":gender,"image":image},
        SetOptions(merge: true),
    ) ;
  }

  String uimage='';
  List info=[];
  String _value='';
  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(userId);
    var dbu = await data.get();
    print(dbu.data());
    setState(() {
      info.add(dbu.get("first name"));
      info.add(dbu.get("last name"));
      info.add(dbu.get("phone"));
      info.add(dbu.get("Gender"));
      uimage = dbu.get('image');
      _value=info[3];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  File? image;
  _openPicker(ImageSource source) async{
    final image= await ImagePicker().pickImage(source: source);
    if(image==null) return;
    final imageTemporary =File(image.path);
    setState(() {
      this.image=imageTemporary;
    });
    Uint8List? uploadFile = this.image?.readAsBytesSync();
      final reference =FirebaseStorage.instance.refFromURL('gs://testfirebaseflutter-aa934.appspot.com/users').child(Uuid().v1());
    UploadTask uploadTask =reference.putData(uploadFile!);
     uploadTask.whenComplete(() async {
        String url = await uploadTask.snapshot.ref.getDownloadURL();
        setState(() {
          uimage = url;
        });
      });
  }


  @override
  Widget build(BuildContext context) {
    print("info "+"${info}");
    return Scaffold(
      appBar:AppBar(
        title: Text('Profile Information',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
        foregroundColor:Colors.white,
      ),
      body:SingleChildScrollView(
        child:(info.length<1)? const SizedBox(height: 10,):Form(
          key:formkey,
          child: Column(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8,0, 0),
                  height: 150,
                  width: 150,
                  child: ClipOval(
                    child:uimage!=''?Image.network(uimage, width:90, height:90, fit: BoxFit.cover,):Image.asset('assets/images/images.png'),
                  ),
                  ),
                FloatingActionButton(
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  backgroundColor: Colors.teal,
                  mini: true,
                  onPressed:(){
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        //final theme = Theme.of(context);
                        return Container(
                              height: 215,
                              child: Container(
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.fromLTRB(9, 10, 0, 0) ,
                                      child:Text('Profile Photo',style:TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
                                    ),
                                    ListTile(
                                      leading:Icon(Icons.camera_alt_outlined,color: Colors.black, size: 20),
                                      title:Text('Camera',style:TextStyle(color:Colors.black,fontSize: 20),),
                                      onTap:(){
                                        _openPicker(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading:Icon(Icons.image_outlined,color: Colors.black, size: 20),
                                      title:Text('Gallery',style:TextStyle(color:Colors.black,fontSize: 20),),
                                      onTap:(){
                                        _openPicker(ImageSource.gallery);
                                      },
                                    ),
                                    ListTile(
                                      leading:Icon(Icons.delete_outline_outlined,color: Colors.black, size: 20),
                                      title:Text('Delete',style:TextStyle(color:Colors.black,fontSize: 20),),
                                      onTap:(){
                                        setState(() {
                                          uimage='';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                          );
                        },
                    );
                  }
                ),
                Container(
                  padding:EdgeInsets.all(13),
                  child:TextFormField(
                    initialValue: info[0],
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your First Name';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>info[0]=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle:TextStyle(color:Colors.black,fontSize: 20),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.black38),
                      ),
                    ),
                  ) ,
                ),

                Container(
                  padding:EdgeInsets.all(13),
                  child:TextFormField(
                    initialValue: info[1],
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your Last Name';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>info[1]=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle:TextStyle(color:Colors.black,fontSize: 20),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.black38),
                      ),
                    ),
                  ) ,
                ),

                Container(
                  padding:EdgeInsets.all(13),
                  child:TextFormField(
                    initialValue: info[2],
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your phone';
                      }
                      else if(val.length!=11){
                        return 'Please Check your phone';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>info[2]=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintStyle:TextStyle(color:Colors.black,fontSize: 20),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.black38),
                      ),
                    ),
                  ) ,
                ),

                Container(
                  padding:EdgeInsets.all(13),
                  child:Row(
                      children:[
                        Text('Gender : ',style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                        Radio<String>(value: 'male',
                          groupValue: _value,
                          onChanged: (value) {
                            setState((){
                              _value=value!;
                            });
                          },
                        ),
                        //SizedBox(width:10),
                        Text('Male',style:TextStyle(color:Colors.black,fontSize: 20)),
                        Radio<String>(value: 'female',
                          groupValue: _value,
                          onChanged: (value) {
                            setState((){
                              _value=value!;
                            });
                          },
                        ),
                        Text('Female',style:TextStyle(color:Colors.black,fontSize: 20))
                      ]
                  ),
                ),
                ElevatedButton(
                  style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.teal),
                      fixedSize:MaterialStateProperty.all(Size(150,45)),
                      shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(18)
                      ))
                  ),
                  onPressed: () {
                    final isValid = formkey.currentState!.validate();
                    if(isValid==true ){
                      updateData(info[0],info[1],info[2],_value,uimage);
                      final delete =FirebaseStorage.instance.refFromURL('gs://testfirebaseflutter-aa934.appspot.com/users').child(userId);
                      delete.delete();
                      showAlertDialog(context,"update information sucessfully");
                      Timer(const Duration(seconds: 3), () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>home(userId:userId)));});

                    }
                  },
                  child: Text('update',style:TextStyle(fontSize: 30)),
                ),
              ]
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context,String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.white,
      title:const Text("Message:", style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,
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