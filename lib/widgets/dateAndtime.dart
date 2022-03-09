import 'tables.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:table_calendar/table_calendar.dart';
import 'background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List tr=[];
class Body extends StatefulWidget{
  final String userId;
  Body({Key? key, required this.userId}) : super(key: key);

  @override
  State<Body> createState() => _MyBody(userId: userId);
}

class _MyBody extends State<Body> {
  final String userId;
  _MyBody({Key? key, required this.userId});
  DateTime _selectTime = DateTime.now();
  DateTime _selectedDay=DateTime.now() ;
  DateTime _focusedDay=DateTime.now();
  DateTime _available = DateTime.now().add(Duration(hours: 3));
  DateTime _stclose = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,00,00,00) ;
  DateTime _endclose = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,00,00) ;
  String? _error=null;
  String ?dat;
  CalendarFormat _format = CalendarFormat.month;
  var time;
  final number =TextEditingController();
 // List <num>tableno = <num>[];
  List <num> d = <num>[];
  num set=0;
  List tr=[];
  CollectionReference table = FirebaseFirestore.instance.collection("tables");
  CollectionReference tdate = FirebaseFirestore.instance.collection("reserve");
 /* gettable() async {
    //final query = await table..where("no-of-sets".toString(),isEqualTo: number.toString()).snapshots();
   // FirebaseFirestore.instance.collection("tables").where('no-of-sets',isEqualTo: number).snapshots();
   // tableno.add(query);
    // table.where('no-of-sets',isEqualTo: number).snapshots();
    // dbt.docs.where((element) =>element['no-of-sets'].toString().contains(number.toString()));
    // element['no-of-sets'].toString().contains(number.toString())).map((e) =>tableno.add(e.data()));
    QuerySnapshot dbt = await table.where("no-of-sets",isEqualTo: set).get();
    tableno=[];
    dbt.docs.forEach((element) {
      setState(() {
        tableno.add(element.get('num'));
      });
    });
    print('table no :$tableno');
  }*/
  gettableanddate() async {
    QuerySnapshot dbt = await table.where("no-of-sets",isEqualTo: set).get();
    List <num> tableno=[];
    dbt.docs.forEach((element) {
      setState(() {
        tableno.add(element.get('num'));
      });
    });
    print('table no :$tableno');
    
      QuerySnapshot t = await tdate.where("date",isEqualTo: DateFormat('yyyy-MM-dd').format(_selectedDay))
          .where("arrived",isEqualTo:false).get();
      d=[];
    t.docs.forEach((element) {
      setState(() {
        d.add(element.get('tableno'));
      });
    });
      print('dataaa:$d');
    // d list, tableno list
       tableno.removeWhere((element) => d.contains(element));
      print('list is $tableno');
      return tableno;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Date And Time',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,

    ),
        body: Background(

         child : SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            buildText('Choose Date '),
            Container(

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white12,width: 2.0)

              ),
              child:TableCalendar(
                focusedDay:DateTime.now(),
                firstDay: DateTime.now(),
                lastDay:DateTime.utc(DateTime.now().year,12,31),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState( () {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarFormat: _format,
                onFormatChanged: (format) {
                  setState(() {
                    _format = format;
                  });
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                ),

              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white12,width: 2.0)
              ),
              child:MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color.fromRGBO(65, 189, 180, 54),
                onPressed:(){
                  setState(() {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) =>Container(
                        height: MediaQuery.of(context).size.height*0.25 ,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft:  Radius.circular(25.0),
                              topRight: Radius.circular(25.0),),
                            border: Border.all(color: Colors.white12,width: 2.0)
                        ),
                        child: hourMinute12H(),
                      ),
                    );
                  });
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Time',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    Text(
                      _selectTime.hour.toString().padLeft(2, '0') + ':' +
                          _selectTime.minute.toString().padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),

            buildText('Choose Number Of Seats '),
            SizedBox(height: 20),
            buildNoSeats(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white12,width: 2.0)
              ),
              child:Center( child:buildDone(context),),
            ),
          ],
        ),
      ),
    ),
  );

  Widget hourMinute12H(){
    return TimePickerSpinner(
      is24HourMode: false,
      spacing: 20,
      itemHeight: 40,
      isForce2Digits: true,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _selectTime = time;
        });
      },
    );
  }

  Widget buildNoSeats() =>Material(
    child:   TextField(
      controller: number,
      keyboardType: TextInputType.number,
      decoration:  InputDecoration(
        hintText: 'Enter number of seats',
        labelText: 'no of seats',
        errorText: _error,
        border: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12.0),
        ),

      ),
    ),
  );
  /*Widget buildtableno(BuildContext context)=>StreamBuilder<QuerySnapshot>(
      stream: table.snapshots().asBroadcastStream(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
          return buildText('There is no avalible table with that Seat number');
        }else{
          return gettable();
        }

      });*/

  Widget buildDone(BuildContext context)=>Builder(
    builder: (context) {
      return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(12.0),
        ),
        onPressed: (){
          final snack =SnackBar(
            content: Text('Resturant close From 12 AM To 10 AM'),
            duration: Duration(seconds: 3),
          );
          final snack2 =SnackBar(
            content: Text('Time Should be After 3 hours From now '),
            duration: Duration(seconds: 3),
          );
          setState(() {
            int numb = int.parse(number.text);
             set = int.parse(number.text) ;
            String dat=DateFormat('yyyy-MM-dd').format(_selectedDay);
            String tim=DateFormat('HH:mm').format(_selectTime);
           // gettableanddate();
           // tr.addAll(tableno);
            if(_selectTime.isAfter(_stclose)&&_selectTime.isBefore(_endclose)){
              Scaffold.of(context).showSnackBar(snack);
            }else
              if(DateFormat('yyyy-MM-dd').format(_selectedDay)==DateFormat('yyyy-MM-dd').format(DateTime.now()))
            {
              if(_selectTime.isAfter(_available)){

              if(number.text.isEmpty) {
                _error='Enter Number of Seats';
              } else {
                _error= null;
                gettableanddate().then((value) {
                  tr.addAll(value);
                  print('ommmm $value');
                  print('ommmm1 $tr');
                  if (value.toString()=="[]"){
                    showAlertDialog(context,numb);
                  }
                  else{
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=> tables(
                          date:dat,
                          time:tim,
                          no: numb,
                          uid: userId,
                          listtables:tr,
                        ),
                      ),);
                  }
                });
              }
            }
              else{
              Scaffold.of(context).showSnackBar(snack2);}
            }
              else{
              if(number.text.isEmpty) {
                _error='Enter Number of Seats';
              } else {
                _error= null;
             gettableanddate().then((value) {
              tr.addAll(value);
                 print('ommmm $value');
                print('ommmm1 $tr');
                if (value.toString()=="[]"){
                  showAlertDialog(context,numb);
                }
                else{
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context)=> tables(
                      date:dat,
                      time:tim,
                      no: numb,
                      uid: userId,
                      listtables:tr,
                    ),
                  ),);
                }
             });
              }
            }
          });
        },
        child: const Text('Done'),
        color: Color.fromRGBO(65, 189, 180, 54),
      );
    }
  );

  Widget buildText(String text)=>Container(
    padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
    ),
  );
  showAlertDialog(BuildContext context, int noseats) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white54,
      title:const Text("Warning:", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
      ),),
      content: Text("There is no available tables in that day with $noseats seats.", style:const  TextStyle(
        fontSize: 18, color: Colors.black,
      ),),
      actions: const [],
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

