import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iota_one_test/app/locator.dart';
import 'package:iota_one_test/presentation/bloc/products_cubit.dart';
import 'package:iota_one_test/presentation/product_list_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
        create: (BuildContext context) {
          return locator<ProductsCubit>();
        },
        child: const ProductListWidget());
  }
}
