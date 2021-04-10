import 'package:flutter/material.dart';

import './screens/product_details_screen.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.grey[350],
      ),
      initialRoute: ProductOverviewScreen.routeID,
      routes: {
        ProductOverviewScreen.routeID: (ctx) => ProductOverviewScreen(),
        ProductDetailsScreen.routeID: (ctx) => ProductDetailsScreen()
      },
    );
  }
}
