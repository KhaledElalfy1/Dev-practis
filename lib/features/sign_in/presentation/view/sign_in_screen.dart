import 'package:dev_practice/features/profile/presentation/view/profile_screen.dart';
import 'package:dev_practice/core/widgets/custom_form_button.dart';
import 'package:dev_practice/core/widgets/custom_input_field.dart';
import 'package:dev_practice/features/sign_in/presentation/view/widgets/dont_have_an_account.dart';
import 'package:dev_practice/features/sign_in/presentation/view/widgets/forget_password_widget.dart';
import 'package:dev_practice/features/sign_in/presentation/view/widgets/page_header.dart';
import 'package:dev_practice/core/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                   // TODO add key
                    child: Column(
                      children: [
                        const PageHeading(title: 'Sign-in'),
                        //!Email
                        CustomInputField(
                          labelText: 'Email',
                          hintText: 'Your email',
                           controller: TextEditingController(),
                        ),
                        const SizedBox(height: 16),
                        //!Password
                        CustomInputField(
                          labelText: 'Password',
                          hintText: 'Your password',
                          obscureText: true,
                          suffixIcon: true,
                           controller: TextEditingController(),
                        ),
                        const SizedBox(height: 16),
                        //! Forget password?
                        ForgetPasswordWidget(size: size),
                        const SizedBox(height: 20),
                        //!Sign In Button
                        CustomFormButton(
                          innerText: 'Sign In',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        //! Dont Have An Account ?
                        DontHaveAnAccountWidget(size: size),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
