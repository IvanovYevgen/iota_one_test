import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iota_one_test/domain/models_http/product.dart';
import 'package:iota_one_test/presentation/bloc/products_cubit.dart';
import 'package:iota_one_test/presentation/details_screen.dart';

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
      if (state is ProductsProcessing) {
        return _loadingIndicator();
      } else if (state is ProductsSucceed) {
        products = state.products;
        return buildContent(products);
      } else if (state is ProductsFailed) {
        return Text(
          state.error,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      return Container();
    });
  }

  Widget buildContent(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(40, 50, 20, 20),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: products[index])),
                );
              },
              child: Image.network(products[index].mainImage ?? '', fit: BoxFit.cover),
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
}
