import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/web.dart' if (dart.library.io) 'dart:io' as platform;

class StorageService {
  static final StorageService instance = StorageService._();
  StorageService._();

  Future<bool?> getBool(String key) async {
    if (kIsWeb) {
      final value = platform.window.localStorage[key];
      return value != null ? value == 'true' : null;
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    }
  }

  Future<void> setBool(String key, bool value) async {
    if (kIsWeb) {
      platform.window.localStorage[key] = value.toString();
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    }
  }
}
