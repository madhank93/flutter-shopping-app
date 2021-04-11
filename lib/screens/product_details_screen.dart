import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final String routeID = "prodcut_details_screen";

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;

    final product = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findByID(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
