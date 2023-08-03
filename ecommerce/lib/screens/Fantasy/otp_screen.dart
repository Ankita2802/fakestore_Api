import 'package:ecommerce/provider/fantasty_provider.dart';
import 'package:ecommerce/theme/app_color.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isVerifying = false;

  @override
  Widget build(BuildContext context) {
    final signupotp = Provider.of<FantastyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Verification Code:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We have sent an verification code \n    to your mobile number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              PinCodeTextField(
                autofocus: true,
                hideCharacter: false,
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.green,
                maxLength: 6,
                pinBoxWidth: 40,
                pinBoxHeight: 40,
                pinTextStyle: const TextStyle(fontSize: 22.0),
                onTextChanged: (value) {
                  debugPrint(value);
                  signupotp.mobiemaillotp = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldcolor,
                  fixedSize: const Size(300, 50),
                ),
                onPressed: () {
                  signupotp.otpverifications();
                  // if (_codeController.text.isEmpty) {
                  //   Utils.snackBar("Plase enter otp", context);
                  // } else {
                  //   signupotp.otpverifications();
                  // }
                },
                child: _isVerifying
                    ? const CircularProgressIndicator()
                    : const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
