class Dog {
  final int? id;
  final String name;
  final int age;

  Dog({this.id, required this.name, required this.age});

  // Convert a Dog into a Map. The keys must match the column names.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Optional: Helpful for printing
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}