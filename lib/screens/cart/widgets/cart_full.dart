import 'package:ecommmerce_app/inner_screens/product_details.dart';
import 'package:ecommmerce_app/provider/products_provider.dart';

import '../../../services/global_methods.dart';

import '../../../models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../provider/cart_provider.dart';

import '../../../constants/colors.dart';
import '../../../provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  final ProductModel product;
  const CartFull({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final cartModel = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    final subTotal = cartModel.price * cartModel.quantity;
    print(cartModel.price);
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 140.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.routeName, arguments: productProvider.getProductsById(cartModel.id));
            },
            child: Container(
              width: 135.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(cartModel.imageUrl),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          cartModel.title,
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {
                            globalMethods.showDialogg(
                                'Remove item!', "The Product will be removed!\nDo you want to delete?", () {
                              cartProvider.deleteCartItem(widget.product.id);
                              Navigator.pop(context);
                            }, context);
                          },
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            child: Icon(
                              FeatherIcons.x,
                              color: Colors.red,
                              size: 22.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Price:'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '\$ ${cartModel.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Sub Total:'),
                      SizedBox(
                        width: 5.0,
                      ),
                      FittedBox(
                        child: Text(
                          '\$ ${subTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: darkTheme ? Colors.brown.shade900 : Theme.of(context).accentColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Ships Free',
                        style: TextStyle(color: darkTheme ? Colors.brown.shade900 : Theme.of(context).accentColor),
                      ),
                      Row(
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              onTap: cartModel.quantity > 1
                                  ? () {
                                      cartProvider.reduceQuantity(widget.product.id);
                                    }
                                  : null,
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  FeatherIcons.minus,
                                  color: cartModel.quantity > 1 ? Colors.red : Colors.grey,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 12.0,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [ColorsConst.gradientLStart, ColorsConst.gradientLEnd],
                                  stops: [0.0, 0.7],
                                ),
                              ),
                              child: Text(
                                cartModel.quantity.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              onTap: () {
                                cartProvider.addCartItems(widget.product);
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  FeatherIcons.plus,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
