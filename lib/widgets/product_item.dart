import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provide.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailsScreen.routeID,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<Product>(
                  builder: (ctx, product, child) => Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<Product>(context, listen: false)
                            .toogleFavourite();
                      },
                      icon: Icon(
                        product.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      cart.addItem(product.id, product.price, product.title);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Item has added to the cart"),
                          action: SnackBarAction(
                              label: "UNDO",
                              textColor: Colors.red,
                              onPressed: () {
                                cart.removeSingleItem(product.id);
                              }),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          footer: Container(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      product.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "₹ " + product.price.toString(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
