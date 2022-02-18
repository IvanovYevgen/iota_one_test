part of 'products_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductsProcessing extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductsSucceed extends ProductState {
  final List<Product> products;

  const ProductsSucceed({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsFailed extends ProductState {
  final String error;

  const ProductsFailed(this.error);

  @override
  List<Object> get props => [error];
}
