import 'package:ecommerce/theme/app_color.dart';
import 'package:ecommerce/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPresse;

  const CustomButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPresse});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresse,
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: AppColors.goldcolor,
            ),
            child: Center(
                // child: loading ? const CircularProgressIndicator(color: Colors.white):
                child: Text(
              title,
              style: authButton,
            )),
          )),
    );
  }
}
