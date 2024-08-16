import 'package:api_practice/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  final String apiUrl = "https://bachatmart.pk/api/products";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      debugPrint(jsonResponse.body);
      return jsonResponse
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
