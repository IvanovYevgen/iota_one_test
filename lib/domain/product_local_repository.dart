import 'package:iota_one_test/domain/models/http/product.dart';

abstract class ProductLocalRepository {
  Future<List<Product>> getProducts();

  Future<void> saveProducts(List<Product> itemDataList);
}
