class Medicines {
  final int medicineID;
  final String name;

  Medicines({
    this.medicineID,
    this.name,
  });

  factory Medicines.fromMap(Map<String, dynamic> json) => new Medicines(
        medicineID: json["medicineID"] as int,
        name: json["name"] as String,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
