import 'package:dev_practice/core/network/api_error_model.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
static  ApiErrorModel handler(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection Timeout');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send Timeout');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive Timeout');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad Certificate');
        case DioExceptionType.badResponse:
          return _handle(error);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request Cancelled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection Error');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Unknown Error');
      }
    } else {
      return ApiErrorModel(message: "Unknown Error");
    }
  }

 static ApiErrorModel _handle(error) {
    switch (error.response.statusCode) {
      case 400:
        return ApiErrorModel(message: 'Bad Request');
      case 401:
        return ApiErrorModel(message: 'Unauthorized');
      case 403:
        return ApiErrorModel(message: 'Forbidden');
      case 404:
        return ApiErrorModel(message: 'Not Found');
      case 500:
        return ApiErrorModel(message: 'Internal Server Error');
      case 503:
        return ApiErrorModel(message: 'Service Unavailable');
      default:
        return ApiErrorModel(message: 'Something went wrong');
    }
  }
}
