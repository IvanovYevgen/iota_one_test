part of 'products_cubit.dart';

abstract class ProductState {
  const ProductState();
}

class ProductsProcessing extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;
  final List<Product> basketProducts;
  final List<Product> viewedProducts;

  const ProductsLoaded(
      {required this.products,
      required this.basketProducts,
      required this.viewedProducts});
}

class ProductsSucceed extends ProductsLoaded {
  const ProductsSucceed(
      {required List<Product> products,
      required List<Product> basketProducts,
      required List<Product> viewedProducts})
      : super(
            products: products,
            basketProducts: basketProducts,
            viewedProducts: viewedProducts);
}

class ProductsViewed extends ProductsLoaded {
  const ProductsViewed(
      {required List<Product> products,
      required List<Product> basketProducts,
      required List<Product> viewedProducts})
      : super(
            products: products,
            basketProducts: basketProducts,
            viewedProducts: viewedProducts);
}

class ProductsToBasket extends ProductsLoaded {
  const ProductsToBasket(
      {required List<Product> products,
      required List<Product> basketProducts,
      required List<Product> viewedProducts})
      : super(
            products: products,
            basketProducts: basketProducts,
            viewedProducts: viewedProducts);
}

class ProductsFailed extends ProductState {
  final String error;

  const ProductsFailed(this.error);
}
