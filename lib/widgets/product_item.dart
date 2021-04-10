import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class ProuctItem extends StatelessWidget {
  final Product product;

  const ProuctItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.favorite_border_outlined,
            color: Colors.red,
          ),
          const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ],
      ),
      footer: Container(
        color: Colors.black54,
        child: Text(
          product.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
