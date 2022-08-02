import 'package:commerce_app/models/products.dart';
import 'package:commerce_app/services/fetch_products.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_data_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchproducts', () {
    test('return products if the http call was successful ', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response(
              '{"id":1, "title":"Fjallraven","price":109.95,"description":"Your perfect pack for everyday use","category":"men\'s clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}}',
              200));

      expect(await HttpFetch.fetchProducts(), isA<Products>());
    });
    test('throws an exception if the http call completes unsuccessfully', () {
      final client = MockClient();
      when(client.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response('Not found', 404));
      expect(HttpFetch.fetchProducts(), Exception());
    });
  });
}
