import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/edit_product_screen.dart';
import 'package:shopapp/screens/user_products_screen.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products(),),
        ChangeNotifierProvider.value(value: Cart(),),
        ChangeNotifierProvider.value(value: Orders(),),
        // TODO: Implement alternative Provider setup using ChangeNotifierProvider.value
      ],
      child: MaterialApp(
          title: 'UACS Shop App',
          theme: ThemeData(
            useMaterial3: false,
            primaryColor: Colors.purple,
            primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
              bodyColor: Colors.white,
            ),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white
            ),
            fontFamily: 'Lato',
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
            // TODO: Add routes for user product management screens
          }),
    );
  }
}
