import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';

import '../widgets/product_item.dart';
import '../providers/product_provider.dart';

enum FilterOprions { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  static final String routeID = "product_overview_screen";

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My shop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOprions selectedValue) {
              setState(() {
                if (selectedValue == FilterOprions.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Favourites"),
                value: FilterOprions.Favourites,
              ),
              PopupMenuItem(
                child: Text("All"),
                value: FilterOprions.All,
              )
            ],
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFavourites),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final providerContainer = Provider.of<ProductsProvider>(context);
    List<Product> products = showFavs
        ? providerContainer.showOnlyFavourites
        : providerContainer.products;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(),
          );
        },
      ),
    );
  }
}
