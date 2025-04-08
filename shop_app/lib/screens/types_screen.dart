import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/types_widget.dart';

class TypesScreen extends StatelessWidget {
  const TypesScreen({super.key});
  static const routeName = '/types';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Types'),
      ),
      body: ListView.builder(
        itemCount: DUMMY_TYPES.length,
        itemBuilder: (ctx, index) {
          return TypesWidget(DUMMY_TYPES[index].id, DUMMY_TYPES[index].title, DUMMY_TYPES[index].color);
        },
      ),
    );
  }
}