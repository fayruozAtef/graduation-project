import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resflutter_app/widgets/widgets.dart';
import 'register.dart';

class log extends StatefulWidget {
  const log({Key? key}) : super(key: key);

  @override
  _logState createState() => _logState();
}

class _logState extends State<log> {
  //Intiallize firebase app
  Future<FirebaseApp> _initializeFirebase()async{
    FirebaseApp firebaseApp=await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Loginpage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);
  //Login function
  static Future<User?> loginUsingEmailPassword({required String email,required String password , required BuildContext context})async{
  final  FirebaseAuth auth=FirebaseAuth.instance;
    User? user ;
    try{
      UserCredential userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        print("This email is not valid");
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    //create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    final deviceSize= MediaQuery.of(context).size;
    return Stack(
      children: [
        Back(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 35,),
                    Image.asset('assets/images/logo.png' , height: 200,width: 250,),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: 'user name'
                      ,hintStyle: TextStyle(color: Colors.white)
                      ,prefixIcon: Icon(Icons.mail,color: Colors.grey),
                      ),
                      style:TextStyle(color:Colors.white),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration:const InputDecoration(hintText: 'password'
                      ,hintStyle: TextStyle(color: Colors.white)
                      ,prefixIcon: Icon(Icons.lock,color: Colors.grey),
                      ),
                      style:TextStyle(color:Colors.white),
                     obscureText: true,
                     // keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 25,
                    ),
                   Text("Don't Remember your password?",
                     style: TextStyle(color: Colors.white),
                   ),
                   SizedBox(
                      height:60,
                      width:130,
                      child: RaisedButton(
                        color:Colors.grey.withOpacity(0.1),

                          onPressed: () async{
                          User? user=await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                          print(user);
                          if(user!=null){
                            //Navigator.of(context).pushReplacementNamed(MaterialPageRoute(builder: (context)=>Register()));
                            Navigator.of(context).pushReplacementNamed('/register');
                          }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        child: const Text('LOGIN',
                        style:TextStyle(
                          color: Colors.white,
                        ) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,
                    ),
                    FlatButton(
                      child:Text('SIGNUP'),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                        onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/register');
                        },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

