import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_widget.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/products';

  final List<Product> availableProducts;
  const ProductScreen(this.availableProducts, {super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}


class _ProductScreenState extends State<ProductScreen> {
  late String typesTitle;
  late List<Product> displayedProducts;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      typesTitle= routeArgs['title'] ?? "";
      final typesId = routeArgs['id'];
      displayedProducts = widget.availableProducts.where((product) {
        return product.types.contains(typesId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(typesTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductWidget(
            id: displayedProducts[index].id,
            types: displayedProducts[index].types,
            title: displayedProducts[index].title,
            image: displayedProducts[index].image,
            price: displayedProducts[index].price,
            description: displayedProducts[index].description,
          );
        },
        itemCount: displayedProducts.length,
      ),
    );
  }
}