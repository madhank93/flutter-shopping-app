import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provide.dart';
import 'package:shopping_app/providers/products_provider.dart';

import './screens/product_details_screen.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.grey[350],
        ),
        initialRoute: ProductOverviewScreen.routeID,
        routes: {
          ProductOverviewScreen.routeID: (ctx) => ProductOverviewScreen(),
          ProductDetailsScreen.routeID: (ctx) => ProductDetailsScreen()
        },
      ),
    );
  }
}
