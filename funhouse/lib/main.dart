import 'package:flutter/material.dart';

void main() {
  runApp(const FunHouseApp());
}

class FunHouseApp extends StatelessWidget {
  const FunHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun House App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FunHouseHomePage(),
    );
  }
}

class FunHouseHomePage extends StatelessWidget {
  const FunHouseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun House App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Section
          Image.network(
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
            height: 250,
            fit: BoxFit.cover,
          ),

          // Title Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Fun House App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Text Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'This app is your gateway to endless fun and excitement. '
                  'Explore games, surprises, and more!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Button Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Let the fun begin!')),
                );
              },
              child: const Text('Start the Fun'),
            ),
          ),
          Image.network(
            'https://th.bing.com/th/id/R.205695a853b77c811026902e928c9780?rik=1twpr9IjYSTOVA&riu=http%3a%2f%2fimg1.wsimg.com%2fisteam%2fstock%2f53126&ehk=TZWvS6GEXnZshQ0nHZny4jMda9sr2xnDv%2fbB%2fPRgd4c%3d&risl=&pid=ImgRaw&r=0',
            height: 250,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Trees tend to be long-lived, some trees reaching several thousand years old. Trees evolved around 400 million years ago, and it is estimated that there are around three trillion mature trees in the world currently.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}