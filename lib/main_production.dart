import 'package:dev_practice/core/cache/shared_pref_helper.dart';
import 'package:dev_practice/core/services/services_locator.dart';
import 'package:dev_practice/my_app.dart';
import 'package:flutter/material.dart';

void main()async {
  setup();
  getIt<SharedPrefHelper>().init();
  runApp(
    const MyApp(),
  );
}
