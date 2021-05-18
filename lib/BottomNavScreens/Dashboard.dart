import 'package:flutter/material.dart';
import 'package:meds_reminder/MedicineList.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final items = List<String>.generate(4, (i) => "Medicine $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //todo:// Replace MedicineCard() with MedicineList() Constructor for ListView Builder.
        child: MedicineList(items),
      ),
    );
  }
}
