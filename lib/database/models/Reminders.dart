class Reminders {
  final int reminderID;
  final int medicineID;
  final int customerID;

  Reminders({
    this.reminderID,
    this.medicineID,
    this.customerID,
  });

  factory Reminders.fromMap(Map<String, dynamic> json) => new Reminders(
        reminderID: json["reminderID"] as int,
        medicineID: json["medicineID"] as int,
      );

  Map<String, dynamic> toMap() => {
        "medicineID": medicineID,
        "customerID": customerID,
      };
}
