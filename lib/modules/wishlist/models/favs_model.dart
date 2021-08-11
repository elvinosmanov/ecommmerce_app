import 'package:flutter/cupertino.dart';

class FavsModel with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  FavsModel(
    this.id,
    this.title,
    this.price,
    this.imageUrl,
  );
}
