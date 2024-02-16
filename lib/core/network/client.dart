// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import '../app_components/app_urls.dart';
import 'custom_interceptors.dart';

class MyClient {
  static MyClient _MyClient = MyClient._internal();
  static Dio? dio;
  factory MyClient() {
    if (dio == null) {
      initializeDio();
    }
    return _MyClient;
  }
  MyClient._internal();

  static Future initializeDio() async {
    dio = Dio();

    dio?.options.baseUrl = AppUrls.baseUrl;
    dio?.options.sendTimeout = Duration(seconds: 120);
    dio?.options.receiveTimeout = Duration(seconds: 120);
    dio?.options.headers["accept"] = 'application/json';
    dio?.options.contentType = Headers.jsonContentType;
    dio?.options.responseType = ResponseType.json;
    dio?.options.followRedirects = true;
    dio?.interceptors.add(CustomInterceptors());
  }
}
