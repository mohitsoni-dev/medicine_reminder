import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:custom_horizontal_calendar/date_row.dart';
import 'package:intl/intl.dart';
import 'package:meds_reminder/HomePage.dart';
import 'package:inline_calender/inline_calender.dart';

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  DateTime chosen = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CustomHorizontalCalendar(
                    onDateChoosen: (date) {
                      setState(() {
                        chosen = date;
                      });
                    },
                    inintialDate: DateTime.now(),
                    height: 60,
                    builder: (context, i, d, width) {
                      if (i != 2)
                        return DateRow(
                          d,
                          width: width,
                        );
                      else
                        return DateRow(
                          d,
                          background: Colors.blue,
                          selectedDayStyle: TextStyle(color: Colors.white),
                          selectedDayOfWeekStyle:
                          TextStyle(color: Colors.white),
                          selectedMonthStyle: TextStyle(color: Colors.white),
                          width: width,
                        );
                    },
                  ),
                  Text(
                    'chosen date',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat.yMd().format(chosen),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
