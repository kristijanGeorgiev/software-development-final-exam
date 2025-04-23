import 'package:flutter/material.dart';

import './product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Products with ChangeNotifier {

  final String authToken;
  final String userId;

  List<Product> _items = [

  ];

  Products(this.authToken, this.userId, this._items);
  var _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  bool get showFavoritesOnly {
    return _showFavoritesOnly;
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  set showFavoritesOnly(bool fav) {
    _showFavoritesOnly = fav;
    notifyListeners();
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';

    var url = Uri(
        scheme: 'https',
        host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
        path: '/products.json',
        query: 'auth=${Uri.encodeQueryComponent(authToken)}&$filterString'
    );

    try {
      final response = await http.get(url);
      if(response.statusCode != 200) {
        throw Error();
      }
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }

      url = Uri(
          scheme: 'https',
          host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
          path: '/userFavorites/$userId.json',
          query: 'auth=${Uri.encodeQueryComponent(authToken)}'
      );
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite:
          favoriteData == null || favoriteData[prodId] == null ? false : favoriteData[prodId],
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri(
        scheme: 'https',
        host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
        path: 'products.json',
        query: 'auth=${Uri.encodeQueryComponent(authToken)}'
    );
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'creatorId': userId,
        }),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri(
          scheme: 'https',
          host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
          path: '/products/$id.json',
          query: 'auth=${Uri.encodeQueryComponent(authToken)}'
      );
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri(
        scheme: 'https',
        host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
        path: '/products/$id.json',
        query: 'auth=${Uri.encodeQueryComponent(authToken)}'
    );
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    //existingProduct = null;
  }
}
