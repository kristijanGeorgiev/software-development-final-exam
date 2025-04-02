import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/products.dart';
class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    // TODO: Implement products loading
    // Steps:
    // 1. Access Products provider
    // 2. Get products list based on showFavs flag
    return GridView.builder
      (
      padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: products[i], child: ProductItem(),));
  }
}
