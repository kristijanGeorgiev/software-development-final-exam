import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // TODO: Implement product detail loading
    // Steps:
    // 1. Access Products provider
    // 2. Find product by ID

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Placeholder(),
            ),
            SizedBox(height: 10),
            Text(''),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(''),
            )
          ],
        ),
      ),
    );
  }
}
