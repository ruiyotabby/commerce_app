import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:commerce_app/models/products.dart';

class HttpFetch {
  static Future<Products> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode != 200) {
      throw (e) {
        e.toString();
      };
    } else {
      return Products.fromJson(jsonDecode(response.body)[0]);
    }
  }
}
