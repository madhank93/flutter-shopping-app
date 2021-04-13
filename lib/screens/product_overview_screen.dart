import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provide.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/badge.dart';
import 'package:shopping_app/widgets/product_grid.dart';

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
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.cartItemCount.toString(),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeID);
                }),
          )
        ],
      ),
      body: ProductGrid(_showOnlyFavourites),
    );
  }
}
