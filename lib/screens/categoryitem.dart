import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/productdescription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItemsScreen extends StatefulWidget {
  String category;
  CategoryItemsScreen({super.key, required this.category});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).clearCategoryItems();
    Provider.of<ProductProvider>(context, listen: false)
        .getproductitems(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Items"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, category, child) {
          final categories = category.categoryItems;
          return categories.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDescriptions(
                                      productId: categories[index].id,
                                    )));
                      },
                      leading: Image.network(
                        categories[index].image,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(categories[index].title),
                      subtitle: Text(categories[index].description),
                    );
                  },
                );
        },
      ),
    );
  }
}
