import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  String currentemail='';
  String currentphone='';


  final formkey=GlobalKey<FormState>();

  String _value='female';
  final String userId;
  information({Key? key,required this.userId});
  String uFname='';
  String uLname='';
  String uemail='';
  String uphone='';
  String ugender='';

  Future updateData(String fname,String lname,String email,String phone,String gender) async{
    CollectionReference db = FirebaseFirestore.instance.collection("users");
    return await db.doc(userId).update({"first name":fname,"last name":lname,"email":email,"phone":phone,"Gender":gender}) ;
  }


  getData() async {
    DocumentReference data = FirebaseFirestore.instance.collection("users").doc(userId);
    var dbu = await data.get();
    setState(() {
      uFname = dbu.get("first name") ;
      uLname = dbu.get("last name");
      uemail = dbu.get("email");
      uphone = dbu.get("phone");
      ugender = dbu.get("Gender");
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Profile Information',style: TextStyle(color: Colors.black,fontSize:25)),
        backgroundColor: Colors.white,
        foregroundColor:Colors.black,
      ),
      body:SingleChildScrollView(
        child: Form(
          key:formkey,
          child: Column(
              children: [
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
                      updateData(currentfname,currentlname,currentemail,currentphone,_value);
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