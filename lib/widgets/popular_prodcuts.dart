import 'package:ecommmerce_app/provider/favs_provider.dart';

import '../provider/cart_provider.dart';

import '../inner_screens/product_details.dart';
import '../models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.contain, image: NetworkImage(product.imageUrl)),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 2,
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 34,
                        // size: 30,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: InkWell(
                        onTap: () {
                          favsProvider.addOrRemoveFavsItems(product);
                        },
                        child: Icon(
                          Icons.star,
                          color: favsProvider.getFavsItems.containsKey(product.id) ? Colors.red : Colors.grey.shade800,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 32,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          '\$ ${product.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Theme.of(context).textSelectionTheme.selectionColor),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey[800]),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(24.0),
                            child: InkWell(
                              onTap: () {
                                cartProvider.getCartItems.containsKey(product.id)
                                    ? cartProvider.deleteCartItem(product.id)
                                    : cartProvider.addCartItems(product);
                              },
                              borderRadius: BorderRadius.circular(24.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                    cartProvider.getCartItems.containsKey(product.id)
                                        ? FeatherIcons.check
                                        : FeatherIcons.shoppingCart,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
