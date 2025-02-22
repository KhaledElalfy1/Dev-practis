import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    const Duration receiveTimeout = Duration(seconds: 30);
    const Duration connectTimeout = Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();
      _dio!.options
        ..connectTimeout = connectTimeout
        ..receiveTimeout = receiveTimeout;
      _dio!.interceptors.add(_dioInterceptors());

      return _dio!;
    }
    return _dio!;
  }

  static Interceptor _dioInterceptors() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      // filter: (options, args) {
      //   options.headers.addAll({
      //     'Content-Type': 'application/json',
      //     'authorized': 'Bearer ${'token'}',
      //   });
      //   return true;
      // },
    );
  }
}
