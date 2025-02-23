import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dev_practice/core/network/api_endpoints.dart';
import 'package:dev_practice/core/network/api_error_handler.dart';

import 'package:dev_practice/core/network/api_result.dart';
import 'package:dev_practice/features/sign_in/data/model/sign_in_request_model.dart';
import 'package:dev_practice/features/sign_in/data/model/sign_in_response_model.dart';

class SignInRepo {
  final ApiConsumer _apiConsumer;

  SignInRepo({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;
  Future<ApiResult<SignInResponseModel>> signIn(
      {required SignInRequestModel signInRequestModel}) async {
    try {
      final response = await _apiConsumer.post(ApiEndPoints.signIn,
          data: signInRequestModel.toJson());
      return ApiResult.success(SignInResponseModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handler(e));
    }
  }
}
