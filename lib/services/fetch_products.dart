import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:commerce_app/models/products.dart';

class ProductsData with ChangeNotifier {
  var map;
  String errMessage = '';
  bool isErr = false;

  Future<List<Products>> fetchProducts(http.Client client) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode != 200) {
      throw (e) {
        isErr = true;
        errMessage = e.toString();
      };
    } else {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      map = parsed.map<Products>((json) => Products.fromJson(json)).toList();

      return parsed.map<Products>((json) => Products.fromJson(json)).toList();
    }
  }
}
