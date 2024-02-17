import 'package:tr_store/core/app_components/app_urls.dart';
import 'package:tr_store/core/network/client.dart';
import 'package:tr_store/models/my_object.dart';
import 'package:tr_store/models/product_model.dart';

class ProductRepo {
  Future<MyObject> getProducts() async {
    var myob = MyObject(isSuccess: false);
    var response = await MyClient.dio?.get(AppUrls.post);
    List<ProductModel> products = [];
    var list = response?.data as List;
    list.forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
    myob.isSuccess = response?.statusCode == 200;
    myob.object = products;
    return myob;
  }

  Future<MyObject> getProductDetails({required String productId}) async {
    var myob = MyObject(isSuccess: false);
    var response = await MyClient.dio?.get(AppUrls.post + "/$productId");
    var product = ProductModel.fromJson(response?.data);
    myob.isSuccess = response?.statusCode == 200;
    myob.object = product;
    return myob;
  }
}
