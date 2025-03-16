import 'package:dev_practice/core/cache/cache_keys.dart';
import 'package:dev_practice/core/cache/secure_storage.dart';
import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dev_practice/core/network/api_endpoints.dart';
import 'package:dev_practice/core/network/api_error_handler.dart';

import 'package:dev_practice/core/network/api_result.dart';
import 'package:dev_practice/features/sign_in/data/model/sign_in_request_model.dart';
import 'package:dev_practice/features/sign_in/data/model/sign_in_response_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
class SignInRepo {
  final ApiConsumer _apiConsumer;

  SignInRepo({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;
  Future<ApiResult<SignInResponseModel>> signIn(
      {required SignInRequestModel signInRequestModel}) async {
    try {
      final response = await _apiConsumer.post(ApiEndPoints.signIn,
          data: signInRequestModel.toJson());
      final data = SignInResponseModel.fromJson(response.data);
      _handleToken(data.token);

      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handler(e));
    }
  }
  void _handleToken(String token) {
    SecureStorage.instance.addData(key: CacheKeys.token, data: token);
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    SecureStorage.instance.addData(
        key: CacheKeys.id, data: payload['id'].toString());
  }
}
