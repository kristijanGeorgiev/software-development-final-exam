import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Expandable ListView')),
        body: ExpandableListView(),
      ),
    );
  }
}

class ExpandableListView extends StatelessWidget {
  final List<DataList> data = [
    DataList(category: 'Mobiles', subItems: [
      DataList(category: 'BlackView', subItems: [
        DataList(category: 'A50'),
        DataList(category: 'A55 Pro'),
        DataList(category: 'A95'),
        DataList(category: 'A100'),
      ]),
      DataList(category: 'Samsung'),
    ]),
    DataList(category: 'Apple', subItems: [
      DataList(category: 'iPhone 5'),
      DataList(category: 'iPhone 6'),
      DataList(category: 'iPhone 6s'),
    ]),
    DataList(category: 'Laptops', subItems: [
      DataList(category: 'Asus'),
      DataList(category: 'Dell'),
      DataList(category: 'HP'),
    ]),
    DataList(category: 'Appliances', subItems: [
      DataList(category: 'Washing Machine'),
      DataList(category: 'AC'),
    ]),
    DataList(category: 'Home Appliances', subItems: [
      DataList(category: 'Water Purifier'),
      DataList(category: 'Inverter'),
      DataList(category: 'Vacuum Cleaner'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((item) => buildExpandableList(item)).toList(),
    );
  }

  Widget buildExpandableList(DataList item) {
    if (item.subItems.isEmpty) {
      return ListTile(
        title: Text(item.category),
      );
    }
    return ExpansionTile(
      title: Text(item.category),
      children: item.subItems.map((subItem) => buildExpandableList(subItem)).toList(),
    );
  }
}

class DataList {
  final String category;
  final List<DataList> subItems;

  DataList({required this.category, this.subItems = const []});
}
