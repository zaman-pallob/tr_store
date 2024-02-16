import 'package:dio/dio.dart';

class ExceptionMessage {
  static Future<String> getMessage(DioException exception) async {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return "Connection error!!";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout!!";
      case DioExceptionType.receiveTimeout:
        return "Recieve timeout!!";
      case DioExceptionType.sendTimeout:
        return "Sent timeout!!";
      case DioExceptionType.badResponse:
        return "Bad response";
      default:
        return "Unknown exception thrown";
    }
  }
}
