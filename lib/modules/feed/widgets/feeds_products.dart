import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../products/models/product_model.dart';
import '../../products/product_details.dart';
import 'feeds_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    ProductModel product = Provider.of<ProductModel>(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
        },
        child: Container(
          width: 240,
          height: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: 80, maxHeight: MediaQuery.of(context).size.height * .2),
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     fit: BoxFit.contain,
                      //     image: NetworkImage(product.imageUrl),
                      //   ),
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Container(
                            width: 50, height: 50, alignment: Alignment.center, child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (!product.isPopular)
                    Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0), topLeft: Radius.circular(2.0)),
                      badgeContent: Text('NEW', style: TextStyle(color: Colors.white)),
                    ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 4.0),
                margin: EdgeInsets.only(right: 4.0, top: 4.0, bottom: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$ ${product.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Quantity: ${product.quantity} left',
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0),
                            onTap: () {
                              showDialog(
                                barrierColor: Colors.black.withOpacity(0.8),
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => FeedsDialog(product: product),
                              );
                            },
                            child: Icon(Icons.more_horiz),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
