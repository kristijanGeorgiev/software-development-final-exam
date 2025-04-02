import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  // TODO: Implement add order functionality
  // Steps:
  // 1. Create new OrderItem
  // 2. Add to orders list
  // 3. Notify listeners
  void addOrder(List<CartItem> cartProducts, double total) {
    
  }
}
