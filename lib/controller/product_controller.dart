import 'package:api_practice/model/productModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading = true;
      refresh();
      final response =
          await http.get(Uri.parse('https://bachatmart.pk/api/products'));
      print(response.body);
      if (response.statusCode == 200) {
        var result = productModelFromJson(response.body);
        productList.value = result.products ?? [];
      } else {
        print('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      refresh();
    }
  }
}
