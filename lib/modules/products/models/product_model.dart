import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final bool isPopular;
  bool? isFavorite;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.productCategoryName,
      required this.brand,
      required this.isPopular,
      this.isFavorite});
}
