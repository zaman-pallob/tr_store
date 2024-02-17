// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class CustomInterceptors implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        "-------------------------------------------------Errors Start----------------------------------------------------------------");
    print("Error Type: " +
        (err.type == DioExceptionType.unknown
            ? "Socket Exception"
            : err.type.toString()));
    print("StatusCode:" + (err.response?.statusCode.toString() ?? ""));
    print("Error Message:" + err.message.toString());

    print(
        "-------------------------------------------------Errors END----------------------------------------------------------------");
    if (err.response != null) {
      handler.resolve(err.response!);
    }

    if (err.type == DioExceptionType.unknown) {
      handler.reject(DioException(requestOptions: RequestOptions(path: "")));
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /*   print(
        "-------------------------------------------------New Request Start------------------------------------------------------------");
    print("Method: " + options.method);
    print("Url:" + options.uri.toString());
    print("Headers: " + options.headers.toString());

    print("Access Token: " + options.headers["authorization"].toString());
    print("Parameters:" + options.queryParameters.toString());
    print("Body data :" + options.data.toString());
    print("Extra : " + options.extra.toString());
    print("Response Type:" +
        options.responseType.toString() +
        ", " +
        "ConnectionTimeout: " +
        options.connectTimeout.toString() +
        ", RecieveTimeout :" +
        options.receiveTimeout.toString());
    print(
        "-------------------------------------------------New Request End------------------------------------------------------------");
*/
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /*  print(
        "-------------------------------------------------Response Start------------------------------------------------------------");
    print("StatusCode: " + response.statusCode.toString());
    print(response.data);
    print(
        "-------------------------------------------------Response END------------------------------------------------------------");
*/
    handler.next(response);
  }
}
