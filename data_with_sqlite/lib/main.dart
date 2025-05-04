import 'package:flutter/material.dart';
import 'models/dog.dart';
import 'helpers/db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog DB Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dog Database Example'),
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
  List<Dog> _dogs = [];

  Future<void> _refreshDogs() async {
    final dogs = await DBHelper.getDogs();
    setState(() {
      _dogs = dogs;
    });
  }

  Future<void> _addSampleDog() async {
    await DBHelper.insertDog(Dog(name: 'Rex', age: 3));
    await _refreshDogs();
  }

  Future<void> _updateFirstDog() async {
    if (_dogs.isNotEmpty) {
      final first = _dogs.first;
      await DBHelper.updateDog(Dog(id: first.id, name: 'Max', age: first.age + 1));
      await _refreshDogs();
    }
  }

  Future<void> _deleteFirstDog() async {
    if (_dogs.isNotEmpty) {
      await DBHelper.deleteDog(_dogs.first.id!);
      await _refreshDogs();
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('List of Dogs in DB:'),
          Expanded(
            child: ListView.builder(
              itemCount: _dogs.length,
              itemBuilder: (context, index) {
                final dog = _dogs[index];
                return ListTile(
                  title: Text(dog.name),
                  subtitle: Text('Age: ${dog.age}'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _addSampleDog, child: const Text("Add")),
              ElevatedButton(onPressed: _updateFirstDog, child: const Text("Update")),
              ElevatedButton(onPressed: _deleteFirstDog, child: const Text("Delete")),
            ],
          )
        ],
      ),
    );
  }
}
