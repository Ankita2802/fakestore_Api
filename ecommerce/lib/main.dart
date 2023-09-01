import 'package:ecommerce/provider/fantasty_provider.dart';

import 'package:ecommerce/screens/selector/consumer.dart';
// import 'package:ecommerce/screens/Fantasy/profile_screen.dart';
// import 'package:ecommerce/screens/Fantasy/splash_screen.dart';
// import 'package:ecommerce/screens/animations/animatedbuild.dart';
// import 'package:ecommerce/screens/animations/basic_animation.dart';
// import 'package:ecommerce/screens/dio/getapi.dart';
// import 'package:ecommerce/screens/dio/getusers.dart';
// import 'package:ecommerce/screens/dio/postusers.dart';
// import 'package:ecommerce/screens/dio/putuser.dart';
// import 'package:ecommerce/screens/hive/crud.dart';
// import 'package:ecommerce/screens/selector/consumer.dart';
// import 'package:ecommerce/screens/selector/consumerscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'screens/pagination/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping-box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FantastyProvider()),
        ChangeNotifierProvider(create: (context) => NumberProvider())
      ],
      child: const MaterialApp(
        home: PaginationScreen(),
      ),
    );
  }
}
