import 'package:dev_practice/core/cache/cache_keys.dart';
import 'package:dev_practice/core/cache/secure_storage.dart';
import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dev_practice/core/network/api_endpoints.dart';
import 'package:dev_practice/core/network/api_error_handler.dart';
import 'package:dev_practice/core/network/api_result.dart';
import 'package:dev_practice/features/profile/data/models/user_model.dart';

class ProfileRepo {
  final ApiConsumer _apiConsumer;

  ProfileRepo(this._apiConsumer);

  Future<ApiResult<UserModel>> getUserProfile() async {
    try {
      String? id = await SecureStorage.instance.getData(key: CacheKeys.id);

      final response = await _apiConsumer.get('${ApiEndPoints.getProfile}/$id');
      final data = UserModel.fromJson(response.data['user']);
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handler(e));
    }
  }
}
