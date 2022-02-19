import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:iota_one_test/app/locator.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/domain/product_remote_repository.dart';
import 'package:iota_one_test/domain/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteRepository _remoteRepository =
      locator<ProductRemoteRepository>();

  @override
  Future<List<Product>> getProducts() async {
    List<Product> productsList = [];
    try {
      productsList = await _remoteRepository.fetchProducts();
    } catch (err) {
      debugPrint(err.toString());
    }
    return productsList;
  }
}
