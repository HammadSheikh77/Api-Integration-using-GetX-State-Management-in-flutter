import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_practice/controller/product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.productList.isEmpty) {
            return const Center(child: Text('No products available'));
          } else {
            return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                var product = controller.productList[index];
                return ListTile(
                  // leading: product.photo != null
                  //     ? Image.network(product.photo!)
                  //     : const Icon(Icons.image_not_supported),
                  title: Text(product.title ?? 'No title'),
                  subtitle: Text(product.description ?? 'No description'),
                  trailing: Text('\$${product.price?.toString() ?? 'N/A'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
