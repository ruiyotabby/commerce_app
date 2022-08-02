import 'package:commerce_app/models/products.dart';
import 'package:commerce_app/services/fetch_products.dart';
import 'package:flutter/foundation.dart';

class ProductsData with ChangeNotifier {
  List list = [];
  Products responseData = Products();
  // bool error = false;

  void fetchData() async {
    try {
      var data = await HttpFetch.fetchProducts();
      responseData = data;
      list = data as List;
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }
}
