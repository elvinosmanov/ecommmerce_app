import 'package:ecommmerce_app/inner_screens/product_details.dart';
import 'package:ecommmerce_app/models/favs_model.dart';
import 'package:ecommmerce_app/provider/favs_provider.dart';
import 'package:ecommmerce_app/provider/products_provider.dart';
import 'package:ecommmerce_app/services/global_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class WishlistFull extends StatelessWidget {
  final globalMethods = GlobalMethods();
  @override
  Widget build(BuildContext context) {
    final favsModel = Provider.of<FavsModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 5.0, right: 30.0, left: 4.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                Navigator.pushNamed(context, ProductDetails.routeName,
                    arguments: productProvider.getProductsById(favsModel.id));
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      child: Image.network(
                        favsModel.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(favsModel.title),
                          SizedBox(height: 8.0),
                          Text("\$ ${favsModel.price}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            width: 30.0,
            height: 30.0,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: ColorsConst.favColor,
              onPressed: () {
                globalMethods.showDialogg(
                    "Wishlist will cleared!", "The Wishlist will be removed!\nDo you want to delete all?", () {
                  favsProvider.deleteFavsItem(favsModel.id);
                  Navigator.pop(context);
                }, context);
              },
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
