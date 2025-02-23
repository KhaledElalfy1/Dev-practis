import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._privateConstructor();

  static final SecureStorage instance = SecureStorage._privateConstructor();

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> addData({required String key, required String data}) async {
    log('SecureStorage.addData: key: $key, data: $data');
    await _flutterSecureStorage.write(key: key, value: data);
  }

  Future<String?>? getData({required String key}) async {
    log('SecureStorage.getData: key: $key');
    return await _flutterSecureStorage.read(key: key);
  }

  Future<void> deleteData({required String key}) async {
    log('SecureStorage.deleteData: key: $key');
    await _flutterSecureStorage.delete(key: key);
  }
}
