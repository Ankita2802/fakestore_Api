import 'package:ecommerce/provider/fantasty_provider.dart';
import 'package:ecommerce/screens/Fantasy/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FantastyProvider>(
      create: (context) => FantastyProvider(),
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
