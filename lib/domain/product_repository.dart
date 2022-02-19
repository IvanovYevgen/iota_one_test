import 'package:iota_one_test/domain/models_http/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
