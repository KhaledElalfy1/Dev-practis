import 'package:dev_practice/features/sign_up/presentation/logic/cubit/sign_up_cubit.dart';
import 'package:dev_practice/features/sign_up/presentation/view/widgets/already_have_an_account_widget.dart';
import 'package:dev_practice/core/widgets/custom_form_button.dart';
import 'package:dev_practice/core/widgets/custom_input_field.dart';
import 'package:dev_practice/features/sign_in/presentation/view/widgets/page_header.dart';
import 'package:dev_practice/core/widgets/page_heading.dart';
import 'package:dev_practice/features/sign_up/presentation/view/widgets/pick_image_widget.dart';
import 'package:dev_practice/features/sign_up/presentation/view/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
           key: cubit.formKey,
            child: Column(
              children: [
                const PageHeader(),
                const PageHeading(title: 'Sign-up'),
                //! Image
                const PickImageWidget(),
                const SizedBox(height: 16),
                //! Name
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'Your name',
                  isDense: true,
                  controller: cubit.nameController,
                ),
                const SizedBox(height: 16),
                //!Email
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  isDense: true,
                   controller: cubit.emailController,
                ),
                const SizedBox(height: 16),
                //! Phone Number
                CustomInputField(
                  labelText: 'Phone number',
                  hintText: 'Your phone number ex:01234567890',
                  isDense: true,
                  controller:cubit.phoneController,
                ),
                const SizedBox(height: 16),
                //! Password
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Your password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                   controller: cubit.passwordController,
                ),
                //! Confirm Password
                CustomInputField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Your password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                   controller: cubit.confirmPasswordController,
                ),
                const SizedBox(height: 22),
                //!Sign Up Button
                CustomFormButton(
                  innerText: 'Signup',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()||true) {
                      cubit.signUpEmitter();
                    }
                  },
                ),
                const SizedBox(height: 18),
                //! Already have an account widget
                const AlreadyHaveAnAccountWidget(),
                const SizedBox(height: 30),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
