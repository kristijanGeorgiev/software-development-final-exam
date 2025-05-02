class Student {
  final int? id;
  final String name;
  final String code;
  final String email;
  const Student({required this.name, required this.code, required this.email, this.id});

  factory Student.fromJson(Map<String,dynamic> json) => Student(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      email: json['email']
  );

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'email': email
  };
}