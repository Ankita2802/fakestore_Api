import 'package:ecommerce/model/userModel.dart';
import 'package:ecommerce/provider/ecommerce_provider.dart';
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
    Provider.of<ProductProvider>(context, listen: false).fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Data"),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, _userModel, child) {
            final user = _userModel.users;
            // ignore: unnecessary_null_comparison
            return _userModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(user[index].id.toString()),
                                Text(user[index].username.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(user[index].email.toString()),
                                Text(user[index].website.toString()),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
