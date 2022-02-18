import 'package:flutter/material.dart';
import 'package:iota_one_test/presentation/common/app_strings.dart';
import 'package:iota_one_test/presentation/product_list_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        centerTitle: true,
      ),
      body: const ProductScreen(),
    );
  }
}
