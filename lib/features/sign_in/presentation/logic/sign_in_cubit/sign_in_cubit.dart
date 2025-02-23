import 'package:dev_practice/features/sign_in/data/model/sign_in_request_model.dart';
import 'package:dev_practice/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:dev_practice/features/sign_in/presentation/logic/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInRepo) : super(const SignInState.initial());
  final SignInRepo _signInRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void signInEmitter() async {
    emit(const SignInState.signInLoading());

    final result = await _signInRepo.signIn(
        signInRequestModel: SignInRequestModel(
      email: emailController.text,
      password: passwordController.text,
    ));

    result.when(
      success: (signInResponse) {
        emit(SignInState.signInSuccess(signInResponse));
      },
      failure: (apiErrorModel) =>
          emit(SignInState.signInFailure(apiErrorModel)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
