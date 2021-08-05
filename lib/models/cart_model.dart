import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;

  CartModel(this.id,this.title, this.price, this.quantity, this.imageUrl);
}
