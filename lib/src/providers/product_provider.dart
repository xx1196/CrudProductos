import 'dart:convert';

import 'package:crud_productos/src/models/product_model.dart';
import 'package:http/http.dart' as Http;

class ProductsProvider {
  final String _url = "https://products-99367.firebaseio.com";

  Future<bool> createProduct(ProductModel product) async {
    final urlProducts = "$_url/products.json";
    final resp =
        await Http.post(urlProducts, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
