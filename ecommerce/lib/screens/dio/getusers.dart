import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  List<dynamic> users = [];
  Future<void> getData() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users');
      if (response.statusCode == 200) {
        setState(() {
          final jsondata = response.data;
          users = jsondata['data'];
          debugPrint(users.toString());
        });
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> DeleteData(int id) async {
    try {
      var response = await Dio().delete('https://reqres.in/api/users/$id');
      if (response.statusCode == 204) {
        debugPrint("deleted $response.data");
        Utils.toastMessage('delete sucessfully,$response.data');
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
      body: users.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Image.network(users[index]['avatar'])),
                  title: Text(users[index]['first_name']),
                  subtitle: Text(users[index]['email']),
                  trailing: InkWell(
                      onTap: () {
                        DeleteData(users[index]['id']);
                      },
                      child: Icon(Icons.delete)),
                );
              },
            ),
    );
  }
}
