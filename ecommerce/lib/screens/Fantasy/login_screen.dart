import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/components/app_textfield_auth.dart';
import 'package:ecommerce/provider/fantasty_provider.dart';
import 'package:ecommerce/screens/Fantasy/otp_screen.dart';
import 'package:ecommerce/screens/Fantasy/register_screen.dart';
import 'package:ecommerce/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;

  TextEditingController emailmobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<FantastyProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginScreen"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Login to FantasyCult",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Comfortaa',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: emailmobileController,
              hintText: "Email Mobile",
              labelText: "Email or Mobile no.",
              onChanged: (value) {
                login.loginmobeem = value;
              },
            ),
            Row(
              children: [
                Checkbox(
                    value: value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    }),
                const Text("I agree to T&C")
              ],
            ),
            CustomButton(
                title: "Send OTP",
                onPresse: () async {
                  await login.logoin();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationScreen()));
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a Member?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldcolor,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
