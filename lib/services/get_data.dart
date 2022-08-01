import 'dart:convert';
import 'dart:developer';

import 'package:commerce_app/models/products.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class getDataProvider extends ChangeNotifier {
  Products productsdata = const Products();
  bool isLoading = false;

  getData() async {
    isLoading = true;
    productsdata = await fetchProducts();
    isLoading = false;
    notifyListeners();
  }

  Future<Products> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        productsdata = Products.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return productsdata;
  }
}
