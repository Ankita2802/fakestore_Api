import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/components/app_button.dart';
import 'package:ecommerce/components/app_textfield_auth.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';

class PutUserScreen extends StatefulWidget {
  const PutUserScreen({super.key});

  @override
  State<PutUserScreen> createState() => _PutUserScreenState();
}

class _PutUserScreenState extends State<PutUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController userid = TextEditingController();
  Future<void> postUsers(String id, String name, String job) async {
    debugPrint('https://reqres.in/api/users/$id');
    try {
      var response = await Dio().put('https://reqres.in/api/users/$id',
          data: {"name": name, "job": job});
      if (response.statusCode == 200) {
        log('user updated,$response.data');
        Utils.toastMessage('Updated successfullt, $response.data');
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
        title: Text("put Form"),
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
                  controller: userid,
                  hintText: 'id',
                  labelText: 'Enter id',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid id!';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
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
                      await postUsers(
                        userid.text.toString(),
                        nameController.text.toString(),
                        jobController.text.toString(),
                      );
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
