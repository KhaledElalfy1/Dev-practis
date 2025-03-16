import 'package:dev_practice/core/routes/routes.dart';
import 'package:dev_practice/features/sign_in/presentation/logic/sign_in_cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_practice/core/widgets/custom_form_button.dart';
import 'package:dev_practice/features/sign_in/presentation/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';

class SignInButtonBlocConsumer extends StatelessWidget {
  const SignInButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is SignInLoading ||
          current is SingInFailure ||
          current is SignInSuccess,
      listener: (context, state) {
        state.maybeWhen(
          signInLoading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          signInSuccess: (signInResponseModel) =>
              Navigator.pushReplacementNamed(context, Routes.profile),
          signInFailure: (apiErrorModel) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
              ),
              title: const Text('Error'),
              content: Text(apiErrorModel.message ?? "An error occurred"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
      child: CustomFormButton(
        innerText: 'Sign In',
        onPressed: () {
          context.read<SignInCubit>().signInEmitter();
        },
      ),
    );
  }
}
