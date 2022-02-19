import 'package:iota_one_test/domain/models_http/product.dart';

abstract class ProductRemoteRepository {
  Future<List<Product>> fetchProducts();
}