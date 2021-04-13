import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  late Map<String, CartItem> _cartItems = {};

  UnmodifiableMapView<String, CartItem> get cartItems {
    return UnmodifiableMapView(_cartItems);
  }

  int get cartItemCount {
    return _cartItems.length;
  }

  void addItem(String productId, double price, String title) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) =>
            CartItem(value.id, value.title, value.price, value.qunatity + 1),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(DateTime.now().toString(), title, price, 1),
      );
    }
    notifyListeners();
  }
}
