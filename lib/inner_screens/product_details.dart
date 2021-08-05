import 'package:badges/badges.dart';
import 'package:ecommmerce_app/provider/favs_provider.dart';

import '../provider/cart_provider.dart';

import '../models/product_model.dart';
import '../provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/wishlist_screen.dart';
import '../widgets/feeds_products.dart';
import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/productDetails";

  ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double padding = 12.0;

  late ThemeData theme;
  late EdgeInsets sidePadding;
  @override
  Widget build(BuildContext context) {
    sidePadding = EdgeInsets.symmetric(horizontal: padding);
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);
    bool cartAdded = cartProvider.getCartItems.containsKey(product.id);
    bool favsAdded = favsProvider.getFavsItems.containsKey(product.id);

    final products = productProvider.getPopularProducts();
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DETAIL'),
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
      body: Stack(
        children: [
          Container(
            height: 250.0,
            alignment: Alignment.topCenter,
            width: double.infinity,
            color: theme.scaffoldBackgroundColor,
            child: Image.network(product.imageUrl),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    customIconButton(
                      onPressed: () {},
                      icon: Icons.save,
                    ),
                    customIconButton(
                      onPressed: () {},
                      icon: Icons.share,
                    ),
                  ],
                ),
                Container(
                  color: theme.scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          product.title,
                          style: theme.textTheme.headline5,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          'US \$${product.price}',
                          style: TextStyle(color: theme.disabledColor, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 0,
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          product.description,
                          style: TextStyle(color: theme.disabledColor, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 0,
                      ),
                      _details('Brand', product.brand),
                      _details('Quantity', '${product.quantity} Left'),
                      _details('Category', product.productCategoryName),
                      _details('Popularity', product.isPopular ? "Popular" : "Not Popular"),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Container(
                        color: theme.backgroundColor,
                        width: double.infinity,
                        height: 140,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 18.0,
                            ),
                            Text(
                              'No reviews yet',
                              style: TextStyle(
                                  wordSpacing: 2.0,
                                  color: theme.textSelectionTheme.selectionColor,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Be the first review!',
                              style: TextStyle(
                                  wordSpacing: 3.0,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: theme.disabledColor),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Suggested Products:',
                          style: TextStyle(
                              color: theme.textSelectionTheme.selectionColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: theme.scaffoldBackgroundColor,
                  height: 300,
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: products[index],
                        child: FeedProducts(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          BeveledRectangleBorder(),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: cartAdded
                            ? MaterialStateProperty.all(Colors.grey)
                            : MaterialStateProperty.all(Colors.redAccent.shade400),
                      ),
                      onPressed: cartAdded
                          ? null
                          : () {
                              cartProvider.addCartItems(product);
                            },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          cartAdded ? 'Added To Cart'.toUpperCase() : 'Add To Cart'.toUpperCase(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          BeveledRectangleBorder(),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Row(
                            children: [
                              Text(
                                'Buy Now'.toUpperCase(),
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.payment_rounded,
                                color: Colors.green,
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        favsProvider.addOrRemoveFavsItems(product);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          BeveledRectangleBorder(),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: MaterialStateProperty.all(theme.disabledColor),
                      ),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: favsAdded
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border_outlined),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  IconButton customIconButton({required Function() onPressed, required IconData icon}) {
    return IconButton(
      splashRadius: 20,
      onPressed: onPressed,
      splashColor: Colors.purple.shade200,
      icon: Icon(
        icon,
        size: 23,
        color: Colors.white,
      ),
    );
  }

  Padding _details(String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            "$title:",
            style: TextStyle(color: theme.textSelectionTheme.selectionColor, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            detail,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: theme.disabledColor),
          )
        ],
      ),
    );
  }
}
