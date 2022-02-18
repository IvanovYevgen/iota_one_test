import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:iota_one_test/data/api/endpoints.dart';
import 'package:iota_one_test/domain/models/http/product.dart';

class HttpHelper {
  static Future<List<Product>> createListOfProducts() async {
    List<Product> products = [];
    try {
      final response = await get(Uri.parse(Endpoints.baseUrl));
      if (response.statusCode == 200) {
        final respJson = json.decode(response.body);
        var jsonlist = respJson['data'] as List;
        jsonlist.forEach((e) {products.add(Product.fromJson(e));
        });
        return products;
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return products;
  }
}
