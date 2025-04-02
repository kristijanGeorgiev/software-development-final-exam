import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Your list of products
  ];

  List<Product> get items {
    return [..._items]; // Returns a copy of the items list
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  // ✅ Add this method to find a product by its ID
  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}