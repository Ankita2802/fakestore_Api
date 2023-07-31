import 'package:ecommerce/provider/ecommerce_provider.dart';
import 'package:ecommerce/screens/cartscreen.dart';
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
        backgroundColor: Colors.cyan,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) => productProvider.product ==
                null
            ? const Center(child: CircularProgressIndicator())
            : productProvider.product == null
                ? const Center(child: Text('Error loading product details.'))
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image:
                                  NetworkImage(productProvider.product!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productProvider.product!.title,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 5,
                                        ),
                                        Text(
                                          productProvider.product!.category
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 10.0),
                                        )
                                      ].map((child) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom:
                                                  10.0), // Set your desired bottom padding here
                                          child: child,
                                        );
                                      }).toList(),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "\$${productProvider.product!.price.toString()}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 20.0,
                                              color: Colors.cyan,
                                            ),
                                            Text(productProvider
                                                .product!.rating.rate
                                                .toString()),
                                          ],
                                        )
                                      ].map((child) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom:
                                                  10.0), // Set your desired bottom padding here
                                          child: child,
                                        );
                                      }).toList(),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Product Details",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            productProvider.product!.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                        Userid: productProvider.product!.id)));
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.cyan),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Text("Add to Cart")
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
