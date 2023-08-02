import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';
import 'package:ecommerce/model/postModel.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/model/userModel.dart';
import 'package:ecommerce/repositry/getproduct_repo.dart';
import 'package:ecommerce/utills/toastmessage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  StoreApiRepository storeApiRepository = StoreApiRepository();
  ProductModel? productModel;
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  List<String> _categories = [];

  List<String> get categories => _categories;

  List<String> category = [];
  List<String> get cate => category;
  void ProductListtems() {
    _products.clear();
    notifyListeners();
  }

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
      developer.log(e.toString(), name: 'error panDetails');
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
      developer.log(e.toString(), name: 'error getParticularproductdetails');
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

  List<ProductModel> _categoryItems = [];

  List<ProductModel> get categoryItems => _categoryItems;
  void clearCategoryItems() {
    _categoryItems.clear();
    notifyListeners();
  }

  Future<bool> getproductitems(String category) async {
    try {
      var response = await storeApiRepository.Categoryitems(category);
      _categoryItems = (response as List<dynamic>)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      debugPrint(_categoryItems.toString());
      notifyListeners();
      return true;
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems => _cartItems;

  Future<bool> getProductLimit(int limit) async {
    try {
      var response = await storeApiRepository.GetProductLimit(limit);
      _cartItems = (response as List<dynamic>)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      debugPrint(_cartItems.toString());
      notifyListeners();
      return true;
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }

  // post for add new product
  Future<bool> postProductAdd(
    String title,
    String price,
    String description,
    String image,
    String category,
    // File selectedFiles,
  ) async {
    try {
      // String base64String = base64Encode(selectedFiles.readAsBytesSync());
      Map<String, dynamic> request = {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category
      };
      final responseData = await storeApiRepository.postProductAPi(request);
      developer.log(request.toString());
      if (responseData['status_code'] == 200 ||
          responseData['status_code'] == 201) {
        developer.log(responseData.toString(), name: '======------');
        Fluttertoast.showToast(
          msg: 'added',
          backgroundColor: Colors.grey,
        );
        return true;
      } else {
        Fluttertoast.showToast(
          msg: 'something went wrong',
          backgroundColor: Colors.grey,
        );
        developer.log(responseData.toString(), name: '======------');
      }
    } catch (e) {
      developer.log("$e", name: " postProduct");
    }
    return false;
  }

  //get for user list
  List<Datum> _users = [];
  List<Datum> get users => _users;

  Future<bool> fetchUser() async {
    try {
      final responseList = await storeApiRepository.getUser();
      debugPrint(responseList.toString());
      if (responseList.isNotEmpty) {
        for (var item in responseList) {
          Datum user = Datum.fromJson(item);
          users.add(user);
        }
        _users = users;
        notifyListeners();
        return true;
      }
    } catch (e) {
      developer.log(e.toString(), name: 'error UserDetails');
    }
    return false;
  }

  //get for postmodel
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  Future<bool> fetchPost() async {
    try {
      final responseList = await storeApiRepository.getPost();
      debugPrint(responseList.toString());
      if (responseList.isNotEmpty) {
        for (var item in responseList) {
          PostModel post = PostModel.fromJson(item);
          posts.add(post);
          notifyListeners();
        }
        _posts = posts;
        notifyListeners();
        return true;
      }
    } catch (e) {
      developer.log(e.toString(), name: 'error UserDetails');
    }
    return false;
  }

  // post api in postcommentsModel
  Future<bool> postCommetsAdd(
    int userid,
    String titlr,
    String body,
  ) async {
    try {
      // String base64String = base64Encode(selectedFiles.readAsBytesSync());
      Map<String, dynamic> request = {
        "userId": userid,
        "title": titlr,
        "body": body,
      };
      final responseData = await storeApiRepository.postcommentAPi(request);
      log(request.toString());
      developer.log(responseData.toString(), name: '======------');
      Utils.toastMessage("created");
      notifyListeners();
      return true;
    } catch (e) {
      developer.log("$e", name: " posComments");
    }
    return false;
  }

  //put api in postcommentModel
  Future<bool> postCommentEdit(
    int userid,
    String title,
    String body,
  ) async {
    try {
      // String base64String = base64Encode(selectedFiles.readAsBytesSync());
      Map<String, dynamic> request = {
        "userId": userid,
        "title": title,
        "body": body,
      };
      final responseData = await storeApiRepository.postcommentAPi(request);
      log(request.toString());
      developer.log(responseData.toString(), name: '======------');
      Utils.toastMessage("Updated");
      notifyListeners();
      return true;
    } catch (e) {
      developer.log("$e", name: " posCommentsEdit");
    }
    return false;
  }
}
