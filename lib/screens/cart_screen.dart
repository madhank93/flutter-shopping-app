import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/providers/cart_provide.dart';
import 'package:shopping_app/providers/orders_provider.dart';
import 'package:shopping_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeID = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addOrder(
                        cart.cartItems.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.cartItems.values.toList()[i].id,
                cart.cartItems.keys.toList()[i],
                cart.cartItems.values.toList()[i].price,
                cart.cartItems.values.toList()[i].quantity,
                cart.cartItems.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
