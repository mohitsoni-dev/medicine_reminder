import 'package:flutter/material.dart';

import 'MedicineCard.dart';

class MedicineList extends StatelessWidget {
  //todo:// Change List DataType to Medicine
  final List<String> ListofMeds;
  // final Function setData;
  // final FlutterLocalNotificationsPlugin flutterlocnotifis;

  MedicineList(this.ListofMeds);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(
          //todo:// Uncomment this after updating MedicineCard() Constructor
          ListofMeds[index]),
      itemCount: ListofMeds.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
