import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<ProductProvider>(context, listen: false);
    categoryProvider.fetchCategories();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          final categories = provider.categories;
          return categories.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryItemsScreen(
                                      category: category,
                                    )));
                      },
                      title: Text(category),
                    );
                  },
                );
        },
      ),
    );
  }
}
