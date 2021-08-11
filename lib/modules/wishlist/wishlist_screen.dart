import 'widgets/wishlist_empty.dart';
import 'widgets/wishlist_full.dart';

import 'provider/favs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WishListScreen extends StatelessWidget {
  static const String routeName = "/wishlistScreen";

  const WishListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final favsProvider = Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text('WishList(${favsProvider.getFavsItems.length})'),
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: favsProvider.getFavsItems.values.elementAt(index), child: WishlistFull());
              },
            ),
          );
  }
}
