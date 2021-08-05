import 'package:ecommmerce_app/constants/colors.dart';
import 'package:ecommmerce_app/constants/network_links.dart';
import 'package:ecommmerce_app/inner_screens/product_details.dart';
import 'package:ecommmerce_app/models/product_model.dart';
import 'package:ecommmerce_app/provider/cart_provider.dart';
import 'package:ecommmerce_app/provider/favs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class FeedsDialog extends StatelessWidget {
  static const routeName = "/feeds-dialog";
  final product;

  const FeedsDialog({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
      ),
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 3.0),
                ],
              ),
              constraints: BoxConstraints(minHeight: 100, maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              color: theme.scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DialogContent(0, product),
                  DialogContent(1, product),
                  DialogContent(2, product),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
              onTap: () {
                Navigator.pop(context);
              },
              child: FittedBox(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    FeatherIcons.x,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DialogContent extends StatelessWidget {
  final int index;
  final ProductModel product;
  const DialogContent(this.index, this.product);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);
    final cartAdded = cartProvider.getCartItems.containsKey(product.id);
    final favsAdded = favsProvider.getFavsItems.containsKey(product.id);

    List<String> text = [
      favsAdded ? 'In wishlist' : 'Add to wishlist',
      'View Product',
      cartAdded ? 'In Cart' : 'Add to Cart'
    ];
    List<Icon> icons = [
      Icon(favsAdded ? Icons.favorite_outlined : Icons.favorite_border_outlined,
          color: favsAdded ? ColorsConst.favColor : Colors.black, size: 28.0),
      Icon(Icons.remove_red_eye_outlined, color: Colors.black, size: 28.0),
      Icon(Icons.shopping_cart_rounded, color: cartAdded ? ColorsConst.cartColor : Colors.black, size: 28.0)
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: index == 0
                  ? () {
                      favsProvider.addOrRemoveFavsItems(product);
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    }
                  : index == 1
                      ? () {
                          Navigator.pushNamed(context, ProductDetails.routeName, arguments: product)
                              .then((value) => Navigator.canPop(context) ? Navigator.pop(context) : null);
                        }
                      : () {
                          cartAdded ? cartProvider.deleteCartItem(product.id) : cartProvider.addCartItems(product);
                          Navigator.pop(context);
                        },
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 4), blurRadius: 5.0)]),
                child: icons[index],
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            text[index],
            style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
