import 'package:flutter/material.dart';
import 'package:iota_one_test/domain/models/http/product.dart';
import 'package:iota_one_test/presentation/common/app_strings.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.details),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.name.toString()),
          buildImage(),
          buildDescription(),
          const SizedBox(height: 12),
          buildAmount(),
          buildSizes(),
          const SizedBox(height: 12),
        ],
      ),
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
        Text(product.price!.amount.toString()),
        const SizedBox(width: 12),
        Text(product.price!.currency.toString()),
      ],
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Image.network(product.mainImage.toString(), fit: BoxFit.cover),
    );
  }

  Padding buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        product.description.toString(),
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
