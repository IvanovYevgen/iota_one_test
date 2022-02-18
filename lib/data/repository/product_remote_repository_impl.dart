import 'package:injectable/injectable.dart';
import 'package:iota_one_test/app/http_helper.dart';
import 'package:iota_one_test/domain/models/http/product.dart';
import 'package:iota_one_test/domain/product_remote_repository.dart';

@LazySingleton(as: ProductRemoteRepository)
class ProductRemoteRepositoryImpl extends ProductRemoteRepository {

  @override
  Future<List<Product>> fetchProducts() async {
    Future<List<Product>>listProducts= HttpHelper.createListOfProducts();
    return listProducts;
  }
  
}
