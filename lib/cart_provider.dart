import 'package:flutter/foundation.dart';

import 'cart_item.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice {
    double total = 0.0;
    for (var cartItem in _cartItems) {
      total += cartItem.product.price * cartItem.quantity;
    }
    return total;
  }

  void addToCart(Product product) {
    final cartItemIndex =
        _cartItems.indexWhere((cartItem) => cartItem.product.id == product.id);

    if (cartItemIndex >= 0) {
      // If the product is already in the cart, update the quantity
      _cartItems[cartItemIndex].quantity++;
    } else {
      // If the product is not in the cart, add a new CartItem
      _cartItems.add(CartItem(product: product, quantity: 1));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
