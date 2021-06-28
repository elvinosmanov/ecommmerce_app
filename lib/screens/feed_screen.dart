import 'package:ecommmerce_app/widgets/feeds_products.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 330,
        padding: EdgeInsets.all(8.0),
        children: List.generate(20, (index) => FeedProducts()),
      ),
    );
  }
}
