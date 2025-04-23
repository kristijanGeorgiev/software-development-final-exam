import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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
  final String authToken;
  final String userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final List<OrderItem> loadedOrders = [];
    try{
      final url = Uri(
          scheme: 'https',
          host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
          path: '/orders/$userId.json',
          query: 'auth=${Uri.encodeQueryComponent(authToken)}'
      );
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: double.parse(orderData['amount'].toString()),
            dateTime: DateTime.parse(orderData['dateTime']),
            products: (orderData['products'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                id: item['id'],
                price: double.parse(item['price'].toString()),
                quantity: int.parse(item['quantity'].toString()),
                title: item['title'],
              ),
            ).toList(),
          ),
        );
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    }catch(error) {
      print(error.toString());
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri(
        scheme: 'https',
        host: 'uacs-shop-application-default-rtdb.europe-west1.firebasedatabase.app',
        path: '/orders/$userId.json',
        query: 'auth=${Uri.encodeQueryComponent(authToken)}'
    );
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
          'id': cp.id,
          'title': cp.title,
          'quantity': cp.quantity,
          'price': cp.price,
        })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}