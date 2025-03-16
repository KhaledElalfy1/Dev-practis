
import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_cubit.dart';
import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpSuccess ||
          current is SignUpFailure ||
          current is SignUpLoading,
      listener: (context, state) {
        state.maybeWhen(
          signUpLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          signUpSuccess: () {
            Navigator.pop(context); 
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sign up success')),
            );
          },
          signUpFailure: (apiErrorModel) {
            Navigator.pop(context); 
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  title: const Text('Error'),
                  content: Text(apiErrorModel.message ?? "An error occurred"),
                );
              },
            );
          },
          orElse: () => {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
