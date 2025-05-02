import 'package:flutter/material.dart';
import 'dao/student_dao.dart';
import 'models/student_model.dart';
import 'setup/database_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseSetup().initDatabase(); // Initialize DB before app runs
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DAO Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Student DAO Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StudentDao _studentDao = StudentDao();
  List<Student> _students = [];

  void _addStudent() async {
    final newStudent = Student(name: "Student ${_students.length + 1}", rollNo: _students.length + 1,);
    await _studentDao.insertStudent(newStudent);
    _loadStudents();
  }

  void _loadStudents() async {
    final students = await _studentDao.getAllStudents();
    setState(() {
      _students = students;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];
          return ListTile(
            title: Text(student.name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }
}