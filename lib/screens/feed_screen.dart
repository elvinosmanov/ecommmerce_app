import '../widgets/product_empty.dart';

import '../models/product_model.dart';
import '../provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/feeds_products.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/feeds';

  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    List<ProductModel> products;
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    if (ModalRoute.of(context)?.settings.arguments != null) {
      name = ModalRoute.of(context)!.settings.arguments as String;
    }
    if (name == 'popular') {
      products = provider.getPopularProducts();
    } else {
      products = provider.getProductsByCategoryName(name);
    }

    return Scaffold(
        body: products.isNotEmpty
            ? SafeArea(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 240 / 330,
                  padding: EdgeInsets.all(4.0),
                  children: products
                      .map((product) => ChangeNotifierProvider.value(
                            value: product,
                            child: FeedProducts(),
                          ))
                      .toList(),
                ),
              )
            : ProductEmpty());
  }
}
