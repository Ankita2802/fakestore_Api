// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/components/app_urls.dart';
import 'package:ecommerce/repositry/base_repositry.dart';

class StoreApiRepository extends BaseRepository {
  //get for product details
  Future getProductDetails() async {
    final response = await getHttp(api: AppUrl.product);
    log(response.body, name: 'getProductetails');
    return json.decode(response.body);
  }

  //get for product particular details
  Future ProductParticularDetails(int productId) async {
    final apiUrl = '${AppUrl.product}/$productId';
    final response = await getHttp(api: apiUrl);
    log(response.body, name: 'getProduParticulaid');
    return json.decode(response.body);
  }

  //get for product categories
  Future ProductCategory() async {
    const apiUrl = AppUrl.productcategory;
    final response = await getHttp(api: apiUrl);
    log(response.body, name: 'getProducteCategory');
    return json.decode(response.body);
  }

  Future GetProductLimit(int limit) async {
    final url = '$AppUrl/products?limit=$limit';
    final response = await getHttp(api: url);
    log(response.body, name: 'getproductlimits');
    return json.decode(response.body);
  }

  // get for categoryitems
  Future Categoryitems(String categoryitems) async {
    final url = AppUrl.productcategory + categoryitems;
    log(url);
    final response = await getHttp(api: url);
    log(response.body, name: 'getcategorytitems');
    return json.decode(response.body);
  }

  //post for product add new
  Future postProductAPi(Map<String, dynamic> data) async {
    final response = await postHttp(api: AppUrl.product, data: data);
    log(response.body, name: 'postProductAPi');
    return json.decode(response.body);
  }

  //get gor list users
  Future getCart() async {
    final response = await getHttp(api: AppUrl.cart);
    log(response.body, name: 'getCartList');
    return json.decode(response.body);
  }

  Future getUser() async {
    final response = await getHttp(api: AppUrl.usersEndpoint);
    log(response.body, name: 'getUserist');
    return json.decode(response.body);
  }

  Future getPost() async {
    final response = await getHttp(api: AppUrl.postcomments);
    log(response.body, name: 'getPostist');
    return json.decode(response.body);
  }

  Future postcommentAPi(
    Map<String, dynamic> data,
  ) async {
    final response = await postHttp(
      api: AppUrl.postcomments,
      data: data,
    );
    log(response.body, name: 'postcommentAPi');
    return json.decode(response.body);
  }

  //put pan PostCommentsModel
  Future editPanApi(Map<String, dynamic> data, int postid) async {
    final apiUrl = '${AppUrl.postcomments}/$postid';
    final response = await postHttp(
      api: AppUrl.postcomments,
      data: data,
    );
    log(response.body, name: 'response editPostApi');
    return json.decode(response.body);
  }
}
