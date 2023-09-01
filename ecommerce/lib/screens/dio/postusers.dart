import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/components/app_textfield_auth.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';

class PostUserScreen extends StatefulWidget {
  const PostUserScreen({super.key});

  @override
  State<PostUserScreen> createState() => _PostUserScreenState();
}

class _PostUserScreenState extends State<PostUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  Future<void> postUsers(String name, String job) async {
    try {
      var response = await Dio().post('https://reqres.in/api/users',
          data: {"name": name, "job": job});
      if (response.statusCode == 201) {
        log('user craete,$response.data');
        Utils.toastMessage('User Creted successfullt, $response.data');
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post Form"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextField(
                  controller: nameController,
                  hintText: 'Name',
                  labelText: 'Enter name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid name!';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: jobController,
                  hintText: 'Job',
                  labelText: 'Enter Job',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid job!';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'save',
                  onPresse: () async {
                    if (_formKey.currentState!.validate()) {
                      await postUsers(nameController.text.toString(),
                          jobController.text.toString());
                      _formKey.currentState!.save();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
