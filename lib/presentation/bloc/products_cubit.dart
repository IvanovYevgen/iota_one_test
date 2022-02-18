import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:iota_one_test/domain/models/http/product.dart';
import 'package:iota_one_test/domain/product_repository.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductState> {
  final ProductRepository repo;

  ProductsCubit(this.repo) : super(ProductsProcessing());

  Future<void> setup() async {
    getProducts();
  }

  Future<void> getProducts() async {
    final List<Product> products;
    if (state is ProductsProcessing) {
      try {
        products = await repo.getProducts();
        emit(ProductsSucceed(products: products));
      } catch (e) {
        emit(ProductsFailed(e.toString()));
      }
    }
  }
}
