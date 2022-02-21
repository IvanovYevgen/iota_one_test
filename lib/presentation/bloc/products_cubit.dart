import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/domain/product_repository.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductState> {
  final ProductRepository repo;
  List<Product> products = [];
  List<Product> basketProducts = [];
  List<Product> viewedProducts = [];

  ProductsCubit(this.repo) : super(ProductsProcessing()){
    getProducts();
  }


  Future<void> getProducts() async {
    if (state is ProductsProcessing) {
      try {
        products = await repo.getProducts();
        emit(ProductsSucceed(
            products: products,
            basketProducts: basketProducts,
            viewedProducts: viewedProducts));
      } catch (e) {
        emit(ProductsFailed(e.toString()));
      }
    }
  }

  void createViewedProducts(Product product)  {
      bool isInViewedProducts = viewedProducts.contains(product);
      if(isInViewedProducts == false) viewedProducts.add(product);
        try {
          emit(ProductsSucceed(
              products: products,
              basketProducts: basketProducts,
              viewedProducts: viewedProducts));
        } catch (e) {
          emit(ProductsFailed(e.toString()));
        }
  }

  Future<void> createBasketProducts(Product product) async {
    bool isInViewedProducts = basketProducts.contains(product);
    if(isInViewedProducts == false) basketProducts.add(product);
          try {
            emit(ProductsSucceed(
                products: products,
                basketProducts: basketProducts,
                viewedProducts: viewedProducts));
          } catch (e) {
            emit(ProductsFailed(e.toString()));
          }
    }
}
