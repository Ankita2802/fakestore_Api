import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/repositry/getproduct_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider with ChangeNotifier {
  StoreApiRepository storeApiRepository = StoreApiRepository();
  //get for user list
  List<dynamic> _users = [];

  List<dynamic> get users => _users;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _users = jsonData['data'];
      notifyListeners();
    } else {
      log('Failed to load users. Error code: ${response.statusCode}');
    }
  }
  //post for userlist
}
