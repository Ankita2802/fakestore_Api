import 'package:ecommerce/components/app_customappbar.dart';
import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/addproductscreen.dart';
import 'package:ecommerce/screens/productdescription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List categories = [
    "jewelery"
        "electronics"
  ];
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            // _buildCategoriesRow(),
            _buildProductsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddProductScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text("Add"),
        ),
      ),
    );
  }

  Consumer<ProductProvider> _buildProductsList() {
    return Consumer<ProductProvider>(
      builder: (context, productprovider, _) {
        return productprovider.products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productprovider.products.length,
                  itemBuilder: (context, index) {
                    final product = productprovider.products[index];
                    return Card(
                      elevation: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDescriptions(
                                        productId: product.id,
                                      )));
                        },
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      product.image,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Expanded(
                                        child: Text(
                                          product.description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "\$${product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Search here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
      ],
    );
  }
}
