import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/fakeapi/postcomments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/fakeapi/getpost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        home: PostScreen(),
      ),
    );
  }
}
