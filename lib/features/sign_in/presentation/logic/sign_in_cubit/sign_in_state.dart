import 'package:dev_practice/core/network/api_error_model.dart';
import 'package:dev_practice/features/sign_in/data/model/sign_in_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.signInLoading() = SignInLoading;
  const factory SignInState.signInSuccess(
      SignInResponseModel signInResponseModel) = SignInSuccess;
  const factory SignInState.signInFailure(ApiErrorModel apiErrorModel) =
      SingInFailure;
}
