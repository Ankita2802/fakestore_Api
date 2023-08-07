import 'package:ecommerce/provider/fantasty_provider.dart';
import 'package:ecommerce/screens/Fantasy/profile_screen.dart';
import 'package:ecommerce/screens/Fantasy/splash_screen.dart';
import 'package:ecommerce/screens/animations/basic_animation.dart';
import 'package:ecommerce/screens/dio/getapi.dart';
import 'package:ecommerce/screens/dio/getusers.dart';
import 'package:ecommerce/screens/dio/postusers.dart';
import 'package:ecommerce/screens/dio/putuser.dart';
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
      child: MaterialApp(
        home: BasicAnimations(),
      ),
    );
  }
}
