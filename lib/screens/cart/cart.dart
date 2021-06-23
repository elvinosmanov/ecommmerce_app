import 'package:ecommmerce_app/screens/cart/cart_empty.dart';
import 'package:ecommmerce_app/screens/cart/cart_full.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List product = [];
    return Scaffold(
        body: product.isEmpty ? CartEmpty() : CartFull());
  }
}
