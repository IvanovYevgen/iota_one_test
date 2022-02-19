import 'package:injectable/injectable.dart';
import 'package:iota_one_test/domain/product_local_repository.dart';

import '../../domain/models_http/product.dart';

@LazySingleton(as: ProductLocalRepository)
class ProductLocalRepositoryImpl extends ProductLocalRepository {
  @override
  Future<List<Product>> getProducts() async {
    List<Product> beerList = [];
    return beerList;
  }

  @override
  Future<void> saveProducts(List<Product> itemDataList) async {}
}
