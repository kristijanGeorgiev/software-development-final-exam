import 'package:flutter/material.dart';
import 'data/app_database.dart';
import 'data/fruit.dart';
import 'data/fruit_dao.dart';

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
      title: 'Sembast Fruit App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const MyHomePage(title: 'Fruit Demo Home Page'),
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
  final FruitDao _fruitDao = FruitDao();
  List<Fruit> _fruits = [];

  @override
  void initState() {
    super.initState();
    _loadFruits();
  }

  Future<void> _loadFruits() async {
    final fruits = await _fruitDao.getAllSortedByName();
    setState(() {
      _fruits = fruits;
    });
  }

  Future<void> _addFruit() async {
    final nameController = TextEditingController();
    bool isSweet = true;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Fruit'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Fruit name'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Is Sweet?'),
                      Switch(
                        value: isSweet,
                        onChanged: (val) => setState(() => isSweet = val),
                      )
                    ],
                  )
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  final fruit = Fruit(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: name,
                    isSweet: isSweet,
                  );
                  await _fruitDao.insertFruit(fruit);
                  _loadFruits();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }


  Future<void> _updateFruit(Fruit fruit) async {
    final nameController = TextEditingController(text: fruit.name);
    bool isSweet = fruit.isSweet;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Fruit'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Fruit name'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Is Sweet?'),
                      Switch(
                        value: isSweet,
                        onChanged: (val) => setState(() => isSweet = val),
                      )
                    ],
                  )
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  final updated = Fruit(id: fruit.id, name: name, isSweet: isSweet);
                  await _fruitDao.updateFruit(updated);
                  _loadFruits();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }


  Future<void> _deleteFruit(Fruit fruit) async {
    final nameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Fruit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Type the name to confirm deletion:'),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Fruit name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim() == fruit.name) {
                  await _fruitDao.deleteFruit(fruit);
                  _loadFruits();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: ListView.builder(
        itemCount: _fruits.length,
        itemBuilder: (context, index) {
          final fruit = _fruits[index];
          return ListTile(
            title: Text(fruit.name),
            subtitle: Text(fruit.isSweet ? "Sweet" : "Not Sweet"),
            onTap: () => _updateFruit(fruit),
            onLongPress: () => _deleteFruit(fruit),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: _addFruit,
            tooltip: 'Add Fruit',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          if (_fruits.isNotEmpty)
            FloatingActionButton(
              heroTag: 'update',
              onPressed: () => _updateFruit(_fruits.last),
              tooltip: 'Update Fruit',
              child: const Icon(Icons.edit),
            ),
          const SizedBox(height: 12),
          if (_fruits.isNotEmpty)
            FloatingActionButton(
              heroTag: 'delete',
              onPressed: () => _deleteFruit(_fruits.last),
              tooltip: 'Delete Fruit',
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete),
            ),
        ],
      ),
    );
  }
}