import 'tables.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:table_calendar/table_calendar.dart';
import 'background.dart';
import 'confirmation.dart';

class Body extends StatefulWidget{

  @override
  State<Body> createState() => _MyBody();
}

class _MyBody extends State<Body> {
  DateTime _selectTime = DateTime.now();
  DateTime _selectedDay=DateTime.now() ;
  DateTime _focusedDay=DateTime.now();
  DateTime _available = DateTime.now().add(Duration(hours: 3));
//var t1= new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,23,59,59);
  DateTime _stclose = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,23,59,59) ;
  DateTime _endclose = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,00,00) ;
  String? _error=null;
  CalendarFormat _format = CalendarFormat.month;
  int no=0;
  var time;
  final number =new TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
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

  Widget buildDone(BuildContext context)=>RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12.0),
    ),
    onPressed: (){
      final snack =SnackBar(
        content: Text('Time Should be After 3 hours From now and Resturant close From 12 AM To 10 AM'),
        duration: Duration(seconds: 5),
      );
      setState(() {
        String dat=DateFormat('yyyy-MM-dd').format(_selectedDay);
        String tim=DateFormat('HH:mm').format(_selectTime);
        if(_selectTime.isAfter(_stclose)&&_selectTime.isBefore(_endclose)){
          Scaffold.of(context).showSnackBar(snack);
        }else if(_selectTime.isAfter(_available)){

          if(number.text.isEmpty) {
            _error='Enter Number of Seats';
          } else {
            _error= null;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context)=> tables(
                  date:dat,
                  time:tim,
                ),

              ),
            );
          }
        }
        else{
          Scaffold.of(context).showSnackBar(snack);
        }
      });

      // ignore: deprecated_member_use

      print('no of seats $no');
    },
    child: const Text('Done'),
    color: Color.fromRGBO(65, 189, 180, 54),
  );

  Widget buildText(String text)=>Container(
    padding: EdgeInsets.fromLTRB(10.0,10.0,0,5),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
    ),
  );







}

