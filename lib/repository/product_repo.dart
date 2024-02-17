import 'package:dio/dio.dart';
import 'package:tr_store/core/app_components/app_urls.dart';
import 'package:tr_store/core/network/client.dart';
import 'package:tr_store/models/my_object.dart';
import 'package:tr_store/models/product_model.dart';

import '../core/network/exception_message.dart';

class ProductRepo {
  Future<MyObject> getProducts() async {
    var myob = MyObject(isSuccess: false, message: "");

    try {
      var response = await MyClient.dio?.get(AppUrls.post);
      List<ProductModel> products = [];
      var list = response?.data as List;
      list.forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      myob.isSuccess = response?.statusCode == 200;
      myob.object = products;
    } catch (e) {
      String exceptionMessage = "";
      if (e is DioException) {
        exceptionMessage = await ExceptionMessage.getMessage(e);
      } else {
        exceptionMessage = e.toString();
      }

      myob.message = exceptionMessage;
    }

    return myob;
  }

  Future<MyObject> getProductDetails({required String productId}) async {
    var myob = MyObject(isSuccess: false, message: "");
    try {
      var response = await MyClient.dio?.get(AppUrls.post + "/$productId");
      var product = ProductModel.fromJson(response?.data);
      myob.isSuccess = response?.statusCode == 200;
      myob.object = product;
    } catch (e) {
      String exceptionMessage = "";
      if (e is DioException) {
        exceptionMessage = await ExceptionMessage.getMessage(e);
      } else {
        exceptionMessage = e.toString();
      }

      myob.message = exceptionMessage;
    }

    return myob;
  }
}
