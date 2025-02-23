import 'package:dev_practice/core/routes/routes.dart';
import 'package:dev_practice/core/services/services_locator.dart';
import 'package:dev_practice/features/profile/presentation/view/profile_screen.dart';
import 'package:dev_practice/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:dev_practice/features/sign_in/presentation/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:dev_practice/features/sign_in/presentation/view/sign_in_screen.dart';
import 'package:dev_practice/features/sign_up/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignInCubit(getIt<SignInRepo>()),
                  child: const SignInScreen(),
                ));
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return null;
    }
  }
}
