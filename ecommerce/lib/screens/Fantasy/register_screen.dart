import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/components/app_navigation.dart';
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
                onChanged: (value) {
                  servicesignup.name = value;
                },
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email',
                onChanged: (value) {
                  servicesignup.email = value;
                },
              ),
              CustomTextField(
                controller: mobileController,
                labelText: 'Mobile',
                hintText: 'Enter Your Mobile',
                onChanged: (value) {
                  servicesignup.mobile = value;
                },
              ),
              CustomTextField(
                controller: dobController,
                labelText: 'Dob',
                hintText: 'Select Date of Birth',
                icon: Icons.calendar_month_rounded,
                onChanged: (value) {
                  servicesignup.dateofb = value;
                },
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text(
              //       "Selct Gender?",
              //       style: TextStyle(fontSize: 18),
              //     ),
              //     RadioListTile(
              //       title: const Text("Male"),
              //       value: "male",
              //       groupValue: gender,
              //       onChanged: (value) {
              //         servicesignup.setSelectedGender(value!);
              //       },
              //     ),
              //     RadioListTile(
              //       title: const Text("Female"),
              //       value: "female",
              //       groupValue: gender,
              //       onChanged: (value) {
              //         servicesignup.setSelectedGender(value!);
              //       },
              //     ),
              //     RadioListTile(
              //       title: const Text("Other"),
              //       value: "other",
              //       groupValue: gender,
              //       onChanged: (value) {
              //         servicesignup.setSelectedGender(value!);
              //       },
              //     ),
              //   ],
              // ),
              for (var gender in genderList)
                RadioListTile<String>(
                  title: Text(gender),
                  value: gender,
                  groupValue: servicesignup.selectedGender,
                  onChanged: (value) {
                    servicesignup.setSelectedGender(value!);
                  },
                ),
              CustomTextField(
                controller: addresController,
                labelText: 'Address',
                hintText: 'Enter Your address',
                onChanged: (value) {
                  servicesignup.addr = value.toString();
                },
              ),
              CustomTextField(
                controller: cityController,
                labelText: 'City',
                hintText: 'Enter Your City',
                icon: Icons.keyboard_arrow_down,
                onChanged: (value) {
                  servicesignup.citys = value.toString();
                },
              ),
              CustomTextField(
                controller: pincodeController,
                labelText: 'Pincode',
                hintText: 'Enter Your Pincode',
                onChanged: (value) {
                  servicesignup.pin = value.toString();
                },
              ),
              CustomTextField(
                controller: stateController,
                labelText: 'state',
                hintText: 'Enter Your state',
                icon: Icons.keyboard_arrow_down,
                onChanged: (value) {
                  servicesignup.states = value.toString();
                },
              ),
              CustomTextField(
                controller: countryController,
                labelText: 'Country',
                hintText: 'Enter Your Country',
                onChanged: (value) {
                  servicesignup.countrys = value.toString();
                },
              ),
              CustomTextField(
                controller: refrecode,
                labelText: 'Referal Code*',
                hintText: 'Enter Referal Code*',
                onChanged: (value) {
                  servicesignup.refcode = value.toString();
                },
              ),
              CustomTextField(
                controller: teamname,
                labelText: 'Team Name',
                hintText: 'Enter Your team name',
                onChanged: (value) {
                  servicesignup.teamn = value.toString();
                },
              ),
              CustomButton(
                  title: 'Lets start',
                  onPresse: () async {
                    await servicesignup.postRegister();
                    nextScreen(context, const VerificationScreen());
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
