import 'package:flutter/material.dart';
import 'student_model.dart';
import 'database_setup.dart';
import 'student_dao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sembast UACS Students',
      home: const StudentHomePage(),
    );
  }
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final StudentDao _studentDao = StudentDao();
  List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    //_getStudents();
  }

  Future<void> _insertStudent() async {
    final student = Student(id: DateTime.now().millisecondsSinceEpoch, name: "John Doe", age: 20);
    await _studentDao.insertStudent(student);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Student Inserted")));
    _getStudents(); // Refresh list
  }

  Future<void> _deleteStudent() async {
    final student = Student(id: 1746387960914, name: "Kristijan Georgiev", age: 22);
    await _studentDao.deleteStudent(student);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Student Deleted")));
    _getStudents(); // Refresh list
  }

  Future<void> _getStudents() async {
    final students = await _studentDao.getStudents();

    for (var student in students) {
      print('ID: ${student.id}, Name: ${student.name}, Age: ${student.age}');
    }

    setState(() {
      _students = students;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sembast UACS Students'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          ElevatedButton(onPressed: _insertStudent, child: const Text("Insert Student")),
          ElevatedButton(onPressed: _getStudents, child: const Text("Get Students")),
          ElevatedButton(onPressed: _deleteStudent, child: const Text("Delete Student")),
          Expanded(
            child: ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text("Age: ${student.age}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}