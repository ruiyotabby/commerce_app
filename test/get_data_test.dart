import 'package:commerce_app/models/products.dart';
import 'package:commerce_app/services/get_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('returning data as a list', () {
    var productsData = ProductsData();
    expect(productsData.list, isA<List<Products>>());
  });
}
