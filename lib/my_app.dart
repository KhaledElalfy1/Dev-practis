import 'package:dev_practice/core/constants/constants.dart';
import 'package:dev_practice/core/routes/app_router.dart';
import 'package:dev_practice/core/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialRoute(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }

  String getInitialRoute() {
    if (isTokenCached) {
      return Routes.profile;
    } else {
      return Routes.login;
    }
  }
}
