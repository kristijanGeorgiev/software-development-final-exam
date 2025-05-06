class Fruit {
  final int id;
  final String name;
  final bool isSweet;

  Fruit({
    required this.id,
    required this.name,
    required this.isSweet,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isSweet': isSweet,
    };
  }

  static Fruit fromMap(Map<String, dynamic> map) {
    return Fruit(
      id: map['id'] as int,
      name: map['name'] as String,
      isSweet: map['isSweet'] as bool,
    );
  }
}
