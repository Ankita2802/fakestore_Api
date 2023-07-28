import 'dart:convert';
import 'dart:developer';
import 'dart:js_interop';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/repositry/getproduct_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  StoreApiRepository storeApiRepository = StoreApiRepository();
  ProductModel? productModel;
  List<ProductModel> _products = [];
  List<String> _categories = [];

  List<String> get categories => _categories;

  List<ProductModel> get products => _products;
  List<String> category = [];
  List<String> get cate => category;

  Future<bool> fetchProducts() async {
    try {
      final responseList = await storeApiRepository.getProductDetails();
      cate.clear();
      if (responseList.isNotEmpty) {
        for (var item in responseList) {
          ProductModel product = ProductModel.fromJson(item);
          products.add(product);
          cate.add(product.category.toString());

          notifyListeners();
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
      _product = ProductModel.fromJson(response);
    } catch (e) {
      log(e.toString(), name: 'error getParticularproductdetails');
    }
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _categories.clear();
        for (var item in data) {
          _categories.add(item);
          notifyListeners();
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  ProductModel? _category;

  ProductModel? get categoryes => _category;

  Future<bool> getproductitems(String category) async {
    try {
      var response = await storeApiRepository.Categoryitems(category);
      if (response.isNull) {
        _category = ProductModel.fromJson(response);
        log(response.toString(), name: 'editBankProvider');
        // Utils.toastMessage("Bank details Updated");
        notifyListeners();
        return response['status_code'];
      } else {
        log(response.toString(), name: 'response editBankProvider');
      }
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
    return false;
  }
}
