import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://i.gadgets360cdn.com/products/large/realme-watch-670x800-1590388807.jpg")),
        ));
  }
}
