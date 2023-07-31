import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCommentScreen extends StatefulWidget {
  @override
  _PostCommentScreenState createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  int _userid = 1;
  String _body = '';

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Posts'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Userid'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a userid';
                  }
                  return null;
                },
                onSaved: (value) => _userid = int.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tittle';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'body'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a body comments';
                  }
                  return null;
                },
                onSaved: (value) => _body = value!,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Create a new product instance
                    final newProduct =
                        services.postCommetsAdd(_userid, _title, _body);

                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
