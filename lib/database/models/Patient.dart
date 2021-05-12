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
        id: json["id"],
        name: json["name"],
        age: json["age"],
        doctor: json["doctor"],
        condition: json["condition"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "doctor": doctor,
        "condition": condition,
      };
}
