import 'package:ecommmerce_app/services/global_methods.dart';

import '../../provider/cart_provider.dart';
import '../../provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import 'widgets/cart_empty.dart';
import 'widgets/cart_full.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart-screen";

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    GlobalMethods globalMethod = GlobalMethods();
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: const CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart(${cartProvider.getCartItems.length})'),
              actions: [
                Container(
                  padding: EdgeInsets.zero,
                  height: 30,
                  child: IconButton(
                    onPressed: () {
                      globalMethod.showDialogg("Clear cart!", "All Cart will be cleared!", () {
                        cartProvider.clearCart();
                        Navigator.pop(context);
                      }, context);
                    },
                    icon: Icon(FeatherIcons.trash),
                  ),
                ),
              ],
            ),
            bottomSheet: checkoutSection(context, cartProvider.totalAmount),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 65.0),
              child: ListView.builder(
                itemCount: cartProvider.getCartItems.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: cartProvider.getCartItems.values.elementAt(index),
                    child: CartFull(
                      product: productProvider.getProductsById(cartProvider.getCartItems.keys.elementAt(index)),
                    ),
                  );
                },
              ),
            ));
  }

  Container checkoutSection(context, double totalAmount) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [ColorsConst.gradientLStart, ColorsConst.gradientLEnd],
                    stops: [0.0, 0.7],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textSelectionTheme.selectionColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total: ',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textSelectionTheme.selectionColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'US \$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
