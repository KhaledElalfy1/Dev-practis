
import 'package:dev_practice/core/network/api_error_model.dart';
import 'package:dev_practice/features/profile/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileLoaded(UserModel userModel) = ProfileLoaded;
  const factory ProfileState.profileFailure(ApiErrorModel apiErrorModel) = ProfileFailure;
}
