import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // TODO: Implement add item functionality
  // Steps:
  // 1. Check if item exists
  // 2. Update quantity or add new item
  // 3. Notify listeners
  void addItem(
    String productId,
    double price,
    String title,
  ) {
    
  }

  // TODO: Implement remove item functionality
  // Steps:
  // 1. Remove item from map
  // 2. Notify listeners
  void removeItem(String productId) {
    
  }

  // TODO: Implement clear cart functionality
  // Steps:
  // 1. Clear items map
  // 2. Notify listeners
  void clear() {

  }
}
