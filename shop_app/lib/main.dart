import 'package:flutter/material.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement state management setup
    // Steps:
    // 1. Setup MultiProvider for multiple providers
    // 2. Order matters - dependent providers should come after their dependencies
    // 3. Use ChangeNotifierProvider for Products, Cart, Orders
    // 4. Initialize with Products, Cart and Order instance
    return MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white
            ),
            fontFamily: 'Lato',
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            )
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        });
  }
}

