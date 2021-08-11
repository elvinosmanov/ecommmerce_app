import 'modules/auth/login_screen.dart';
import 'modules/cart/cart_screen.dart';
import 'modules/feed/widgets/feeds_dialog.dart';
import 'modules/landing/landing_screen.dart';
import 'modules/wishlist/wishlist_screen.dart';

import 'modules/feed/feed_screen.dart';
import 'modules/wishlist/provider/favs_provider.dart';

import 'modules/cart/provider/cart_provider.dart';

import 'modules/products/provider/products_provider.dart';

import 'modules/products/product_details.dart';

import 'modules/brands/brands_navigation_rail.dart';

import 'constants/theme_data.dart';
import 'config/dark_theme_provider.dart';
import 'package:provider/provider.dart';

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
              LoginScreen.routeName: (_) => LoginScreen(),
            },
            home: LandingScreen(),
          );
        },
      ),
    );
  }
}
