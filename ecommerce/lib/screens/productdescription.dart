import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDescriptions extends StatefulWidget {
  final int productId;

  const ProductDescriptions({super.key, required this.productId});

  @override
  State<ProductDescriptions> createState() => _ProductDescriptionsState();
}

class _ProductDescriptionsState extends State<ProductDescriptions> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .fetchProductById(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Description'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) => productProvider.product ==
                null
            ? const Center(child: CircularProgressIndicator())
            : productProvider.product == null
                ? const Center(child: Text('Error loading product details.'))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(productProvider.product!.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text('Product ID: ${productProvider.product!.id}'),
                      Text('Product Name: ${productProvider.product!.title}'),
                      Text(
                          'Price: \$${productProvider.product!.price.toStringAsFixed(2)}'),
                    ],
                  ),
      ),
    );
  }
}
