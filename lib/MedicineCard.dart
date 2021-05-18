import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicineCard extends StatelessWidget {
  //todo:// Uncomment below four lines when database is completed And Change DataType to Medicine
  final String medicine;
  // final Function setData;
  // final FlutterLocalNotificationsPlugin flutterlocnotifis;

  MedicineCard(this.medicine);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      color: Colors.blue.shade500,
      child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          title: Text(
            //todo:// Name of medicine goes here.
            medicine,
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                //todo:// Time of medicine goed here.
                DateFormat("HH:mm")
                    .format(DateTime.fromMillisecondsSinceEpoch(100000)),
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ],
          ),
          leading: Container(
            width: 64.0,
            height: 64.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(64.0),
              //todo:// Enter Medicine type here.
              child: Image.asset('assets/images/syringe.png'),
            ),
          )),
    );
  }
}
