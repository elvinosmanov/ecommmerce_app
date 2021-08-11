import 'package:flutter/cupertino.dart';

import '../models/favs_model.dart';
import '../../products/models/product_model.dart';

class FavsProvider with ChangeNotifier {
  Map<String, FavsModel> _favsItems = {};

  Map<String, FavsModel> get getFavsItems => _favsItems;

  void addOrRemoveFavsItems(ProductModel product) {
    if (_favsItems.containsKey(product.id)) {
      deleteFavsItem(product.id);
    } else {
      _favsItems.putIfAbsent(product.id, () => FavsModel(product.id, product.title, product.price, product.imageUrl));
      notifyListeners();
    }
  }

  void deleteFavsItem(String productId) {
    _favsItems.remove(productId);
    notifyListeners();
  }

  void clearFavs() {
    _favsItems = {};
    notifyListeners();
  }
}
