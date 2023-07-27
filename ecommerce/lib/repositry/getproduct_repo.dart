// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/components/app_urls.dart';
import 'package:ecommerce/repositry/base_repositry.dart';
import 'package:flutter/material.dart';

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
    log(response.body, name: 'getProductetails');
    return json.decode(response.body);
  }

  Future GetProductLimit(int limit) async {
    final url = '${AppUrl.product}/roducts?limit=$limit';
    final response = await getHttp(api: url);
    log(response.body, name: 'getproductlimits');
    return json.decode(response.body);
  }
}
