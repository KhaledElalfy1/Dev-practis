import 'package:dev_practice/core/cache/cache_keys.dart';
import 'package:dev_practice/core/cache/secure_storage.dart';
import 'package:dev_practice/core/network/api_endpoints.dart';
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
        ..receiveTimeout = receiveTimeout
        ..baseUrl = ApiEndPoints.baseUrl;
      _dio!.interceptors
        ..add(_dioInterceptors())
        ..add(_dioInterceptorWrapper());

      return _dio!;
    }
    return _dio!;
  }

  static InterceptorsWrapper _dioInterceptorWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token=await SecureStorage.instance.getData(key: CacheKeys.token);
        options.headers.addAll({
          'token':token==null?null:"FOODAPI $token",
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );
  }

  static Interceptor _dioInterceptors() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
    );
  }
}
