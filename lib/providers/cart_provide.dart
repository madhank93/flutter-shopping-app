import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  late Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems {
    return UnmodifiableMapView(_cartItems);
  }

  int get cartItemCount {
    return _cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => Cart(value.id, value.title, value.price, value.quantity + 1),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => Cart(DateTime.now().toString(), title, price, 1),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId]!.quantity > 1) {
      _cartItems.update(
          productId,
          (existingCart) => Cart(
                existingCart.id,
                existingCart.title,
                existingCart.price,
                existingCart.quantity - 1,
              ));
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
