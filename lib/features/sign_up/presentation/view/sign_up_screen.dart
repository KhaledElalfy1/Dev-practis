import 'package:dev_practice/features/sign_up/presentation/view/widgets/already_have_an_account_widget.dart';
import 'package:dev_practice/core/widgets/custom_form_button.dart';
import 'package:dev_practice/core/widgets/custom_input_field.dart';
import 'package:dev_practice/features/sign_in/presentation/view/widgets/page_header.dart';
import 'package:dev_practice/core/widgets/page_heading.dart';
import 'package:dev_practice/features/sign_up/presentation/view/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            // TODO add key
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
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 16),
                //!Email
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  isDense: true,
                   controller: TextEditingController(),
                ),
                const SizedBox(height: 16),
                //! Phone Number
                CustomInputField(
                  labelText: 'Phone number',
                  hintText: 'Your phone number ex:01234567890',
                  isDense: true,
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 16),
                //! Password
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Your password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                   controller: TextEditingController(),
                ),
                //! Confirm Password
                CustomInputField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Your password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                   controller: TextEditingController(),
                ),
                const SizedBox(height: 22),
                //!Sign Up Button
                CustomFormButton(
                  innerText: 'Signup',
                  onPressed: () {},
                ),
                const SizedBox(height: 18),
                //! Already have an account widget
                const AlreadyHaveAnAccountWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
