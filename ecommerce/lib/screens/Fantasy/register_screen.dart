import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/components/app_textfield_auth.dart';
import 'package:ecommerce/provider/fantasty_provider.dart';
import 'package:ecommerce/screens/Fantasy/homescreen.dart';
import 'package:ecommerce/screens/Fantasy/otp_screen.dart';
import 'package:ecommerce/screens/homescreen.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController refrecode = TextEditingController();
  TextEditingController teamname = TextEditingController();
  String? gender;
  void cleardata() {
    lastnameController.clear();
    emailController.clear();
    mobileController.clear();
    dobController.clear();
    addresController.clear();
    cityController.clear();
    pincodeController.clear();
    stateController.clear();
    countryController.clear();
    refrecode.clear();
    teamname.clear();
    setState(() {
      gender = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final servicesignup = Provider.of<FantastyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Screen"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CustomTextField(
                controller: lastnameController,
                labelText: 'Username',
                hintText: 'Enter Your Username',
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email',
              ),
              CustomTextField(
                controller: mobileController,
                labelText: 'Mobile',
                hintText: 'Enter Your Mobile',
              ),
              CustomTextField(
                controller: dobController,
                labelText: 'Dob',
                hintText: 'Select Date of Birth',
                icon: Icons.calendar_month_rounded,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selct Gender?",
                    style: TextStyle(fontSize: 18),
                  ),
                  RadioListTile(
                    title: const Text("Male"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Female"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Other"),
                    value: "other",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ],
              ),
              CustomTextField(
                controller: addresController,
                labelText: 'Address',
                hintText: 'Enter Your address',
              ),
              CustomTextField(
                controller: cityController,
                labelText: 'City',
                hintText: 'Enter Your City',
                icon: Icons.keyboard_arrow_down,
              ),
              CustomTextField(
                controller: pincodeController,
                labelText: 'Pincode',
                hintText: 'Enter Your Pincode',
              ),
              CustomTextField(
                controller: stateController,
                labelText: 'state',
                hintText: 'Enter Your state',
                icon: Icons.keyboard_arrow_down,
              ),
              CustomTextField(
                controller: countryController,
                labelText: 'Country',
                hintText: 'Enter Your Country',
              ),
              CustomTextField(
                controller: refrecode,
                labelText: 'Referal Code*',
                hintText: 'Enter Referal Code*',
              ),
              CustomTextField(
                controller: teamname,
                labelText: 'Team Name',
                hintText: 'Enter Your team name',
              ),
              CustomButton(
                  title: 'Lets start',
                  onPresse: () async {
                    if (lastnameController.text.isEmpty) {
                      Utils.snackBar("Plase enter name", context);
                    } else if (emailController.text.isEmpty) {
                      Utils.snackBar("Plase enter email", context);
                    } else if (mobileController.text.isEmpty) {
                      Utils.snackBar("plase enter mobile", context);
                    } else if (mobileController.text.length < 10) {
                      Utils.snackBar('Mobilenumber must be 10 digit', context);
                    } else if (addresController.text.isEmpty) {
                      Utils.snackBar('please enter address', context);
                    } else if (cityController.text.isEmpty) {
                      Utils.snackBar('please enter city', context);
                    } else if (pincodeController.text.isEmpty) {
                      Utils.snackBar('please enter pincode', context);
                    } else if (stateController.text.isEmpty) {
                      Utils.snackBar('please enter state', context);
                    } else if (countryController.text.isEmpty) {
                      Utils.snackBar('please enter country', context);
                    } else if (refrecode.text.isEmpty) {
                      Utils.snackBar('please enter refercode', context);
                    } else if (teamname.text.isEmpty) {
                      Utils.snackBar('please enter teamname', context);
                    } else {
                      servicesignup.postRegister(
                          emailController.text.toString(),
                          mobileController.text.toString());
                    }
                  })
            ].map((child) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0), // Set your desired bottom padding here
                child: child,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
