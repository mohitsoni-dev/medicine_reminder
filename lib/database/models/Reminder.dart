class Reminder {
  final int id;
  final String medname;
  final int timing;

  Reminder({
    this.id,
    this.medname,
    this.timing,
  });

  factory Reminder.fromMap(Map<String, dynamic> json) => new Reminder(
    id: json["id"] as int,
    medname: json["medname"] as String,
    timing: json["timing"] as int,
  );

  Map<String, dynamic> toMap() => {
    "medname": medname,
    "timing": timing,
  };
}
