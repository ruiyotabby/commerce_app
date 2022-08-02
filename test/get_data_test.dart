import 'package:commerce_app/models/products.dart';
import 'package:commerce_app/services/get_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchproducts', () {
    test('return products if the http call was successful ', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://fakestoreapi.com/products/1')))
          .thenAnswer((_) async => http.Response(
              '{"id":1, "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest, stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men\'s clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120,}}',
              200));
      expect(await fetchProducts(client), isA<Products>());
    });
    test('throws an exception if the http call completes unsuccessfully', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://fakestoreapi.com/products/1')))
          .thenAnswer((_) async => http.Response('Not found', 404));
      expect(fetchProducts(client), throwsException);
    });
  });
}
