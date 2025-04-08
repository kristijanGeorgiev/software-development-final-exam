import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_detail_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  final List<Product> availableProducts;

  const ProductDetailScreen(this.availableProducts, {super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String productName;
  late Product selectedProducts;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      productName = routeArgs['name'] ?? "";
      final productId = routeArgs['id'];
      selectedProducts = widget.availableProducts.firstWhere((product) => product.id == productId);
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductDetailWidget(
              id: selectedProducts.id,
              types: selectedProducts.types,
              title: selectedProducts.title,
              image: selectedProducts.image,
              price: selectedProducts.price,
              description: selectedProducts.description
          );
        },
        itemCount: 1,
      ),
    );
  }
}