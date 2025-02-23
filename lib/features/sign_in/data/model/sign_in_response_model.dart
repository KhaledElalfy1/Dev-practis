import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  final String message;
  final String token;

  SignInResponseModel({required this.message, required this.token});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
