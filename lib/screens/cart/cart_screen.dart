import 'widgets/cart_empty.dart';
import 'widgets/cart_full.dart';

import '../../constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = [];
    // ignore: prefer_is_not_empty
    return products.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: _buildAppBar(),
            bottomSheet: checkoutSection(context),
            body: buildCartFull());
  }

  Padding buildCartFull() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 65.0),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return CartFull();
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Cart(8)'),
      actions: [
        Container(
          padding: EdgeInsets.zero,
          height: 30,
          child: IconButton(
            onPressed: () {},
            icon: Icon(FeatherIcons.trash),
          ),
        ),
      ],
    );
  }

  Container checkoutSection(BuildContext context) {
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
                    colors: [
                      ColorsConst.gradientLStart,
                      ColorsConst.gradientLEnd
                    ],
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
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor),
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
                'US \$179.9',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
