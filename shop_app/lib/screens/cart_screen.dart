import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // TODO: Implement Cart provider access
    // Steps:
    // 1. Use Provider.of to get Cart instance
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(''),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      // TODO: Implement order creation
                      // Steps:
                      // 1. Access Orders provider
                      // 2. Add new order with cart items and total
                      // 3. Clear the cart
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            // TODO: Implement cart items list
              // Steps:
              // 1. Use cart.items.length for itemCount
              // 2. Create CartItem widget with item data
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
