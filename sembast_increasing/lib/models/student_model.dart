class Student {
  final int? id;
  final String name;
  final int rollNo;

  Student({this.id, required this.name, required this.rollNo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rollNo': rollNo,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      rollNo: map['rollNo'],
    );
  }
}
