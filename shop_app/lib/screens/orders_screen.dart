import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // TODO: Implement orders loading
    // Steps:
    // 1. Access Orders provider
    // 2. Get list of orders

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      // TODO: Implement orders list
      // Steps:
      // 1. Display orders using ListView.builder
      // 2. Create OrderItem widget for each order
      body: Placeholder(),
    );
  }
}
