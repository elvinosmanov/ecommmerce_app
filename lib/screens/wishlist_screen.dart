import 'package:ecommmerce_app/widgets/wishlist_empty.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = "/wishlistScreen";

  const WishListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List products = [];
    // ignore: prefer_is_not_empty
    return products.isEmpty ? Scaffold(body: WishlistEmpty()) : Scaffold();
  }
}
