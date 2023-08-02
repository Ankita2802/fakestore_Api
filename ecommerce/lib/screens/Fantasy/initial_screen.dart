import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/screens/Fantasy/login_screen.dart';
import 'package:ecommerce/screens/Fantasy/register_screen.dart';
import 'package:ecommerce/theme/app_assets.dart';
import 'package:flutter/material.dart';

class InitialSCreen extends StatefulWidget {
  const InitialSCreen({super.key});

  @override
  State<InitialSCreen> createState() => _InitialSCreenState();
}

class _InitialSCreenState extends State<InitialSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.initialimage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(children: [
            CustomButton(
                title: "Log in",
                onPresse: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Register",
                onPresse: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                }),
          ]),
        ),
      ),
    );
  }
}
