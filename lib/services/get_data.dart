import 'package:commerce_app/models/products.dart';
import 'package:commerce_app/services/fetch_products.dart';
import 'package:flutter/foundation.dart';

class ProductsData with ChangeNotifier {
  List list = [];
  late Products responseData;


  void fetchData() async {
    try {
      var data = await HttpFetch.fetchProducts();
      list = data as List;
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }
}
