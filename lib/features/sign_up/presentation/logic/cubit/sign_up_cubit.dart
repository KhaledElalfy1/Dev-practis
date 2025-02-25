import 'package:dev_practice/core/network/api_error_handler.dart';
import 'package:dev_practice/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:dev_practice/features/sign_up/data/repository/sing_up_repo.dart';
import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._singUpRepo) : super(const SignUpState.initial());
  final SingUpRepo _singUpRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? profileImage;

  void picImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _changeProfilePic(image);
    }
  }

  void _changeProfilePic(XFile image) async {
    profileImage = image;
    emit(const SignUpState.profilePicPicked());
  }

  void signUpEmitter() async {
    emit(const SignUpState.signUpLoading());
    final result = await _singUpRepo.signUp(
      signUpRequestModel: SignUpRequestModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        location: '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        profilePic: profileImage,
      ),
    );
    result.when(
      success: (data) {
        emit(const SignUpState.signUpSuccess());
      },
      failure: (error) {
        emit(SignUpState.signUpFailure(ApiErrorHandler.handler(error)));
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    return super.close();
  }
}
