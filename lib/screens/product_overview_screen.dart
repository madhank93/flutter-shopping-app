import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';

import '../widgets/product_item.dart';
import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  static final String routeID = "product_overview_screen";

  final List<Product> loadedProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My shop"),
      ),
      body: ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> loadedProduct =
        Provider.of<ProductsProvider>(context).products;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: loadedProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ProuctItem(loadedProduct[index]);
        },
      ),
    );
  }
}
