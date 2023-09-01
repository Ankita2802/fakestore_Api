// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Data"),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, postdata, child) {
            final post = postdata.posts;
            return post == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: post.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(post[index].id.toString()),
                            Text(post[index].title.toString()),
                            Text(post[index].body.toString()),
                            GestureDetector(
                                onTap: () {}, child: const Icon(Icons.edit))
                          ],
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
