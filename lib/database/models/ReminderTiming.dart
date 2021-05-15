import 'package:flutter/rendering.dart';

class ReminderTimings {
  final int reminderID;
  final String time;

  ReminderTimings({
    this.reminderID,
    this.time,
  });

  factory ReminderTimings.fromMap(Map<String, dynamic> json) =>
      new ReminderTimings(
        reminderID: json["reminderID"] as int,
        time: json["time"] as String,
      );

  Map<String, dynamic> toMap() => {
        "reminderID": reminderID,
        "time": time
      };
}
