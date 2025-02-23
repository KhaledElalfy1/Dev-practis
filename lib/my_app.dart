import 'package:dev_practice/core/routes/app_router.dart';
import 'package:dev_practice/core/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute:AppRouter.onGenerateRoute,
    );
  }
}