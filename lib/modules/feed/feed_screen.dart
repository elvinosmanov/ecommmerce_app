import 'package:badges/badges.dart';
import 'widgets/feeds_products.dart';
import '../products/widgets/product_empty.dart';
import '../../constants/colors.dart';
import '../cart/provider/cart_provider.dart';
import '../wishlist/provider/favs_provider.dart';
import '../wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../products/models/product_model.dart';
import '../products/provider/products_provider.dart';
import '../cart/cart_screen.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/feeds';

  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    List<ProductModel> products;
    final provider = Provider.of<ProductProvider>(context, listen: false);
    if (ModalRoute.of(context)?.settings.arguments != null) {
      name = ModalRoute.of(context)!.settings.arguments as String;
    }
    if (name == 'popular') {
      products = provider.getPopularProducts();
    } else {
      products = provider.getProductsByCategoryName(name);
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Text('Feeds'),
          actions: [
            Consumer<FavsProvider>(
              builder: (context, value, child) => Badge(
                toAnimate: true,
                badgeColor: ColorsConst.favBadgeColor,
                position: BadgePosition.topEnd(top: 5, end: 5),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(value.getFavsItems.length.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WishListScreen.routeName);
                  },
                  icon: Icon(Icons.favorite_border_outlined),
                  color: ColorsConst.favColor,
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) => Badge(
                toAnimate: true,
                badgeColor: ColorsConst.cartBadgeColor,
                position: BadgePosition.topEnd(top: 5, end: 5),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(value.getCartItems.length.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: Icon(
                    FeatherIcons.shoppingCart,
                    color: Colors.purple[900],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: products.isNotEmpty
            ? SafeArea(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 240 / 330,
                  padding: EdgeInsets.all(4.0),
                  children: products
                      .map((product) => ChangeNotifierProvider.value(
                            value: product,
                            child: FeedProducts(),
                          ))
                      .toList(),
                ),
              )
            : const ProductEmpty());
  }
}
