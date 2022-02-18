import 'package:iota_one_test/domain/models/http/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
