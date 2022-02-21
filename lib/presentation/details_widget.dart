import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/presentation/bloc/products_cubit.dart';
import 'package:iota_one_test/presentation/common/app_strings.dart';

class DetailsWidget extends StatelessWidget {
  final Product product;

  const DetailsWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.details),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(product.name ?? ''),
          buildImage(),
          buildDescription(),
          const SizedBox(height: 12),
          buildAmount(),
          buildSizes(),
          buildRowIcon(context, product),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Row buildRowIcon(BuildContext context, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {

            context.read<ProductsCubit>().createBasketProducts(product);
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.blue,
          ),
          iconSize: 20.0,
        ),
        const Text(AppStrings.clickToAdd),
      ],
    );
  }

  Row buildSizes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.sizes),
        const SizedBox(width: 12),
        Text(product.sizes.toString()),
      ],
    );
  }

  Row buildAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(product.price!.amount ?? ''),
        const SizedBox(width: 12),
        Text(product.price!.currency ?? ''),
      ],
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
          height: 200,
          child: Image.network(product.mainImage ?? '', fit: BoxFit.cover)),
    );
  }

  Padding buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        product.description ?? '',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
