import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          // TODO: Implement Cart Consumer
          // TODO: Implement cart badge
          // Steps:
          // 1. Display cart item count from Provider
          // 2. Update badge value when cart changes
        ],
      ),
      drawer: AppDrawer(),
      // TODO: Implement products grid
      // Steps:
      // 1. Pass filter flag to ProductsGrid
      // 2. Update grid when filter changes
      body: Placeholder()
    );
  }
}
