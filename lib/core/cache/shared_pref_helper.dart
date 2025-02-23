import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> removeValue({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  Future<void> setValue({required String key, required dynamic value}) async {
    log('SharedPrefHelper.setValue: key: $key, value: $value');
    switch (value.runtimeType) {
      case const (int):
        await _sharedPreferences.setInt(key, value);
        break;
      case const (double):
        await _sharedPreferences.setDouble(key, value);
        break;
      case const (String):
        await _sharedPreferences.setString(key, value);
        break;
      case const (bool):
        await _sharedPreferences.setBool(key, value);
        break;
      default:
        throw Exception('Invalid value type');
    }
  }

  String getStringValue({required String key}) {
    return _sharedPreferences.getString(key) ?? '';
  }

  int getIntValue({required String key}) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  double getDoubleValue({required String key}) {
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  bool getBoolValue({required String key}) {
    return _sharedPreferences.getBool(key) ?? false;
  }
}
