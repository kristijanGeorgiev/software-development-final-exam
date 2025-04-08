import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/screens/types_screen.dart';
import './dummy_data.dart';
import 'models/product.dart';

void main() => runApp(ProductApp());
class ProductApp extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductApp> {
  final List<Product> _availableProducts = DUMMY_PRODUCT;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1), // <-- Set scaffold background here
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyMedium: const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        titleMedium: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueGrey,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blueGrey,
        backgroundColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
    );
    return MaterialApp(
      title: 'Shop App',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.yellow
        ),
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TypesScreen(),
        ProductScreen.routeName: (ctx) =>
            ProductScreen(_availableProducts),
        ProductDetailScreen.routeName: (ctx) =>
            ProductDetailScreen(_availableProducts)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => TypesScreen(),
        );
      },
    );
  }
}
