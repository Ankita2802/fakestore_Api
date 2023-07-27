import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/getproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/model/product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        home: ProductScreen(),
      ),
    );
  }
}
