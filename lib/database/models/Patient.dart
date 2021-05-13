class Patient {
  final int id;
  final String name;
  final String doctor;
  final int age;
  final String condition;

  Patient({
    this.id,
    this.name,
    this.age,
    this.condition,
    this.doctor,
  });

  factory Patient.fromMap(Map<String, dynamic> json) => new Patient(
        id: json["id"] as int,
        name: json["name"] as String,
        age: json["age"] as int,
        doctor: json["doctor"] as String,
        condition: json["condition"] as String,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "age": age,
        "doctor": doctor,
        "condition": condition,
      };
}
