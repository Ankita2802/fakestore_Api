import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<ProductProvider>(context, listen: false);
    categoryProvider.fetchCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          final categories = provider.categories;
          return categories.isEmpty
              ? const Center(
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
                                builder: (context) => CategoryItemScreen(
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
