class Reminder {
  final int id;
  final String medicine;
  final int dosage;
  final String prescription;


  Reminder({
    this.id,
    this.medicine,
    this.dosage,
    this.prescription,
  });

  factory Reminder.fromMap(Map<String, dynamic> json) => new Reminder(
    id: json["id"] as int,
    medicine: json["medicine"] as String,
    dosage: json["dosage"] as int,
    prescription: json["prescription"] as String,
  );

  Map<String, dynamic> toMap() => {
    "medicine": medicine,
    "dosage": dosage,
    "prescription": prescription,
  };
}