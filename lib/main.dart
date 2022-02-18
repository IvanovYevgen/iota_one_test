import 'package:flutter/material.dart';
import 'package:iota_one_test/app/locator.dart';
import 'package:iota_one_test/presentation/common/app_colors.dart';
import 'package:iota_one_test/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: AppColors.mainBackground,
        scaffoldBackgroundColor: AppColors.mainBackground,
      ),
      home: const HomePage(),
    );
  }
}
