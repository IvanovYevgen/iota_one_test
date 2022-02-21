import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iota_one_test/app/locator.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/presentation/bloc/products_cubit.dart';
import 'package:iota_one_test/presentation/details_widget.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<ProductsCubit>()..getProducts(),
      child: DetailsWidget(product: product),
    );
  }
}
