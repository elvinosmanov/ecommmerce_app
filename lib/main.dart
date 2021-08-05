import 'package:ecommmerce_app/provider/favs_provider.dart';
import 'package:ecommmerce_app/widgets/feeds_dialog.dart';

import 'provider/cart_provider.dart';

import 'provider/products_provider.dart';

import 'inner_screens/product_details.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/feed_screen.dart';
import 'screens/wishlist_screen.dart';

import 'inner_screens/brands_navigation_rail.dart';

import 'constants/theme_data.dart';
import 'provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_bar_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  ProductProvider productsProvider = ProductProvider();
  CartProvider cartProvider = CartProvider();
  FavsProvider favsProvider = FavsProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => productsProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => cartProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => favsProvider,
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeData.darkTheme, context),
            title: 'Material App',
            routes: {
              // "/home": (_) => BottomBarScreen(),
              BrandsNavigationRail.routeName: (_) => BrandsNavigationRail(),
              CartScreen.routeName: (_) => CartScreen(),
              FeedScreen.routeName: (_) => FeedScreen(),
              WishListScreen.routeName: (_) => WishListScreen(),
              ProductDetails.routeName: (_) => ProductDetails(),
              FeedsDialog.routeName: (_) => FeedsDialog(),
            },
            home: BottomBarScreen(),
          );
        },
      ),
    );
  }
}
