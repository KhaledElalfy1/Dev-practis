import 'package:dev_practice/core/cache/cache_keys.dart';
import 'package:dev_practice/core/cache/secure_storage.dart';
import 'package:dev_practice/core/cache/shared_pref_helper.dart';
import 'package:dev_practice/core/constants/constants.dart';
import 'package:dev_practice/core/services/services_locator.dart';
import 'package:dev_practice/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await checkUser();
  getIt<SharedPrefHelper>().init();
  runApp(
    const MyApp(),
  );
}

Future<void> checkUser() async {
  final token = await SecureStorage.instance.getData(key: CacheKeys.token);
  if (token == null) {
    isTokenCached = false;
  } else {
    isTokenCached = true;
  }
}
