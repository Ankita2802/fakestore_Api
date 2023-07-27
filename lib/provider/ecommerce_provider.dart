import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/repositry/getproduct_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  StoreApiRepository storeApiRepository = StoreApiRepository();
  ProductModel? productModel;
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<bool> fetchProducts() async {
    try {
      final responseList = await storeApiRepository.getProductDetails();
      if (responseList.isNotEmpty) {
        for (var item in responseList) {
          ProductModel product = ProductModel.fromJson(item);

          products.add(product);
        }

        _products = products;
        notifyListeners();
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'error panDetails');
    }
    return false;
  }

  ProductModel? _product;

  ProductModel? get product => _product;
  Future<void> fetchProductById(int id) async {
    try {
      final response = await storeApiRepository.ProductParticularDetails(id);

      // final jsondata = json.decode(response.body);
      _product = ProductModel.fromJson(response);
    } catch (e) {
      log(e.toString(), name: 'error getParticularproductdetails');
    }
    notifyListeners();
  }
}
