import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/presentation/bloc/products_cubit.dart';
import 'package:iota_one_test/presentation/common/app_strings.dart';
import 'package:iota_one_test/presentation/details.screen.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(builder: (context, state) {
      List<Product> products = [];
      List<Product> basketProducts = [];
      List<Product> viewedProducts = [];
      if (state is ProductsProcessing) {
        return _loadingIndicator();
      } else if (state is ProductsSucceed) {
        products = state.products;
        viewedProducts = state.viewedProducts;
        basketProducts = state.basketProducts;
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // basketProducts.isEmpty
              //     ? const Text(AppStrings.noAddedProducts)
              //     :
              _buildBasketProducts(basketProducts),
              const SizedBox(height: 8),
              const Text(AppStrings.newProducts,
                  style: TextStyle(fontSize: 24)),
              _buildContent(products),
              const Text(AppStrings.viewedProducts),
              viewedProducts.isEmpty
                  ? const Text(AppStrings.noViewedProducts)
                  : _buildViewedProducts(viewedProducts),
              const SizedBox(height: 8)
            ],
          ),
        );
      } else if (state is ProductsFailed) {
        return Text(
          state.error,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      return Container();
    });
  }

  Widget _buildContent(List<Product> products) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(40, 12, 12, 20),
          subtitle: Row(
            children: [
              Text(products[index].price!.amount ?? '',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 12),
              Text(products[index].price!.currency ?? '',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
          leading: SizedBox(
            height: 100,
            width: 100,
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProductsCubit>()
                    .createViewedProducts(products[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: products[index])),
                );
              },
              child: Image.network(products[index].mainImage ?? '',
                  fit: BoxFit.cover),
            ),
          ),
          title: Text(products[index].name ?? ''),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildViewedProducts(List<Product> viewedProducts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: viewedProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          // contentPadding: const EdgeInsets.fromLTRB(40, 4, 4, 20),
          subtitle: Row(
            children: [
              Text(viewedProducts[index].name ?? '',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBasketProducts(List<Product> basketProducts) {
    int howManyProducts = basketProducts.length;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: basketProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(40, 50, 20, 20),
          subtitle: Row(
            children: [
              const Text(AppStrings.youHaveAdded),
              _validationBasketProducts(howManyProducts),
              const Text(AppStrings.products),
            ],
          ),
        );
      },
    );
  }

  Widget _validationBasketProducts(int howManyProducts) {
    if (howManyProducts > 0 && howManyProducts != null) {
      return Text(howManyProducts.toString());
    } else {
      return const Text('');
    }
  }
}
