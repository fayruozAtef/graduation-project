import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home.dart';

class profileInfo extends StatefulWidget {

  final String uid;
  profileInfo({Key? key,required this.uid}) : super(key: key);

  @override
  createState()=>information(userId:uid);

}

class information extends State<profileInfo> {
  String currentfname='';
  String currentlname='';
  String currentphone='';


  final formkey=GlobalKey<FormState>();

  String _value='female';
  final String userId;
  information({Key? key,required this.userId});
  String uFname='';
  String uLname='';
  String uphone='';
  String ugender='';
  String uimage='';

  Future updateData(String fname,String lname,String phone,String gender,String image) async{
    CollectionReference db = FirebaseFirestore.instance.collection("users");
    return await db.doc(userId).set({"first name":fname,"last name":lname,"phone":phone,"Gender":gender,"image":image},
        SetOptions(merge: true),
    ) ;
  }

  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(userId);
    var dbu = await data.get();
    setState(() {
      uFname = dbu.get("first name") ;
      uLname = dbu.get("last name");
      uphone = dbu.get("phone");
      ugender = dbu.get("Gender");
      uimage = dbu.get('image');
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  File? image;
  _openPicker() async{
    final image= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
    final imageTemporary =File(image.path);
    setState(() {
      this.image=imageTemporary;
    });
    Uint8List? uploadFile = this.image?.readAsBytesSync();
      final reference =FirebaseStorage.instance.refFromURL('gs://testfirebaseflutter-aa934.appspot.com/users').child(userId);
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
    return Scaffold(
      appBar:AppBar(
        title: Text('Profile Information',style: TextStyle(color: Colors.white,fontSize:25)),
        backgroundColor: Colors.black,
        foregroundColor:Colors.white,
      ),
      body:SingleChildScrollView(
        child: Form(
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
                  onPressed: _openPicker,
                ),
                Container(
                  padding:EdgeInsets.all(13),
                  child:TextFormField(
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your First Name';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>currentfname=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: uFname,
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
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your Last Name';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>currentlname=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: uLname,
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
                    validator: (val){
                      if(val!.isEmpty) {
                        return 'Please Enter your phone';
                      }
                      else if(val.length!=11){
                        return 'Please Check your phone';
                      }
                      return null;
                    },
                    onChanged: (val)=>setState(()=>currentphone=val),
                    style:TextStyle(color:Colors.black,fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: uphone,
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
                      updateData(currentfname,currentlname,currentphone,_value,uimage);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>home(userId:userId)));
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
}