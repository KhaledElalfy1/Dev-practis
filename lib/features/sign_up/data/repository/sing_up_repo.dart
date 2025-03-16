import 'package:dev_practice/core/functions/upload_image_to_api.dart';
import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dev_practice/core/network/api_endpoints.dart';
import 'package:dev_practice/core/network/api_error_handler.dart';
import 'package:dev_practice/core/network/api_result.dart';
import 'package:dev_practice/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:dev_practice/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:dio/dio.dart';

class SingUpRepo {
  final ApiConsumer _apiConsumer;

  SingUpRepo(this._apiConsumer);

  Future<ApiResult<SignUpResponseModel>> signUp(
      {required SignUpRequestModel signUpRequestModel}) async {
    try {
      final Map<String, dynamic> formData = signUpRequestModel.toJson();
      formData['profilePic'] =
          await uploadImageToAPI(signUpRequestModel.profilePic!);
      final response = await _apiConsumer.post(
        ApiEndPoints.signUp,
        data: FormData.fromMap(formData),
      );

      return ApiResult.success(SignUpResponseModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handler(e));
    }
  }
}
