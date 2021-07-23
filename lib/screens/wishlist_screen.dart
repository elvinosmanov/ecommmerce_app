import 'package:flutter/material.dart';

import '../widgets/wishlist_empty.dart';
import '../widgets/wishlist_full.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = "/wishlistScreen";

  const WishListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List wishlist = [];
    return wishlist.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('WishList(7)'),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return WishlistFull();
              },
            ),
          );
  }
}
