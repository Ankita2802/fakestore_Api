// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/provider/apiusers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreeb extends StatefulWidget {
  const UserScreeb({super.key});

  @override
  State<UserScreeb> createState() => _UserScreebState();
}

class _UserScreebState extends State<UserScreeb> {
  @override
  void initState() {
    Provider.of<UsersProvider>(context, listen: false).fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Data"),
        ),
        body: Consumer<UsersProvider>(
          builder: (context, userModel, child) {
            final user = userModel.users;

            return user == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user[index]['avatar'])),
                        title: Text(user[index]['first_name']),
                        subtitle: Text(user[index]['last_name']),
                      );
                    },
                  );
          },
        ));
  }
}
