import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProuctItem extends StatelessWidget {
  final Product product;

  const ProuctItem(this.product);

  @override
  Widget build(BuildContext context) {
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
                IconButton(
                  onPressed: () {
                    Provider.of<ProductsProvider>(context, listen: false)
                        .toogleFavourite(product.id);
                  },
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
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
