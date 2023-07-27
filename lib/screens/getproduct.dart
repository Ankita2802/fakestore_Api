import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/productdescription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Consumer<ProductProvider>(
        builder: (context, productprovider, _) {
          if (productprovider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: productprovider.products.length,
              itemBuilder: (context, index) {
                ProductModel product = productprovider.products[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDescriptions(
                                  productId: product.id,
                                )));
                  },
                  leading: Image.network(
                    product.image,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(product.title.toString()),
                  subtitle: Text('Price: \$${product.price}'),
                  trailing: Text(product.category.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
