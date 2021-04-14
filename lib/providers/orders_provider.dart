import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/cart.dart';
import 'package:shopping_app/models/order.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  UnmodifiableListView<Order> get orders {
    return UnmodifiableListView(_orders);
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
