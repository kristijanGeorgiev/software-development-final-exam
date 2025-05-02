import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products?>(
          create: (_) => null,
          update: (ctx, auth, previousProducts) => Products(
            auth.token.toString(),
            auth.userId.toString(),
            previousProducts == null ? [] : previousProducts.items,
          ),
          // builder: (ctx, auth) => Products(
          //       auth.token,
          //       auth.userId,
          //       previousProducts == null ? [] : previousProducts.items,
          //     ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders?>(
          create: (_) => null,//Orders("","",[]),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token.toString(),
            auth.userId.toString(),
            previousOrders == null ? [] : previousOrders.orders,
          ),
          // builder: (ctx, auth, previousOrders) => Orders(
          //       auth.token,
          //       auth.userId,
          //       previousOrders == null ? [] : previousOrders.orders,
          //     ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'UACS Shop App',
          theme: ThemeData(
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
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (ctx, authResultSnapshot) =>
            authResultSnapshot.connectionState ==
                ConnectionState.waiting
                ? SplashScreen()
                : AuthScreen(),
          ),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}