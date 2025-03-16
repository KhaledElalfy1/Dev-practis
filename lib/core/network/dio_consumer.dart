import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer({required Dio dio}) : _dio = dio;

  @override
  Future<Response> delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio.delete(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio.patch(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _dio.post(path, data: data, queryParameters: queryParameters);
  }
}
