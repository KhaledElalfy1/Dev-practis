

import 'package:dev_practice/core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';
@Freezed()
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.profilePicPicked() = ProfilePicPicked;
  const factory SignUpState.signUpLoading() = SignUpLoading;
  const factory SignUpState.signUpSuccess() = SignUpSuccess;
  const factory SignUpState.signUpFailure(ApiErrorModel apiErrorModel) = SignUpFailure;
}
