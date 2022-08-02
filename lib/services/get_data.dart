import 'dart:convert';
import 'dart:developer';

import 'package:commerce_app/models/products.dart';
import 'package:http/http.dart' as http;

Future<Products> fetchProducts(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    return Products.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
