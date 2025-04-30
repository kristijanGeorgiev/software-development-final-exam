import 'package:flutter/material.dart';
import 'dao/student_dao.dart';
import 'models/student_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dao = StudentDao();

  // Insert sample student
  await dao.insertStudent(Student(id: 1, name: "Alice", age: 20));
  await dao.insertStudent(Student(id: 2, name: "Bob", age: 22));

  // Retrieve and print all students
  await dao.getAllStudents();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Sembast Student DB"))),
    );
  }
}
