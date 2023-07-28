import 'package:ecommerce/provider/ecommerce_provider.dart';
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
    Provider.of<ProductProvider>(context, listen: false)
        .getproductitems(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  productProvider.categoryes!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Container(
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
                                          productProvider.categoryes!.title,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 5,
                                        ),
                                        Text(
                                          productProvider.categoryes!.category
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 10.0),
                                        )
                                      ].map((child) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  10.0), // Set your desired bottom padding here
                                          child: child,
                                        );
                                      }).toList(),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "\$${productProvider.categoryes!.price.toString()}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
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
                                          padding: EdgeInsets.only(
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
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
                      ],
                    ),
                  ),
      ),
    );
  }
}
