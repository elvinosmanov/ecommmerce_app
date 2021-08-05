import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems => _cartItems;

  double get totalAmount {
    double totalAmount = 0;
    _cartItems.forEach((key, value) {
      totalAmount += value.price * value.quantity;
    });
    return totalAmount;
  }

  void addCartItems(ProductModel product) {
    _cartItems.update(
        product.id, (value) => CartModel(value.id, value.title, value.price, value.quantity + 1, value.imageUrl),
        ifAbsent: () => CartModel(product.id, product.title, product.price, 1, product.imageUrl));
    notifyListeners();
  }

  void deleteCartItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void reduceQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId, (value) => CartModel(value.id, value.title, value.price, value.quantity - 1, value.imageUrl));
      notifyListeners();
    }
  }
}
