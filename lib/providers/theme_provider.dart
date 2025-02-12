import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pdslab/services/storage_service.dart';

part 'theme_provider.g.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 132, 181, 245),
    onPrimary: Color.fromARGB(255, 42, 57, 77),
    secondary: Color.fromARGB(255, 103, 166, 248),
    onSecondary: Color.fromARGB(255, 33, 53, 78),
    tertiary: Color.fromARGB(255, 163, 200, 249),
    onTertiary: Color.fromARGB(255, 33, 53, 78),
    error: Color.fromARGB(255, 234, 12, 12),
    onError: Color.fromARGB(255, 37, 9, 2),
    surface: Color.fromARGB(255, 230, 239, 250),
    onSurface: Color.fromARGB(255, 30, 53, 80),
  ),
);
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 42, 57, 77),
    onPrimary: Color.fromARGB(255, 230, 239, 250),
    secondary: Color.fromARGB(255, 59, 80, 107),
    onSecondary: Color.fromARGB(255, 195, 217, 247),
    error: Color.fromARGB(255, 234, 12, 12),
    onError: Color.fromARGB(255, 248, 248, 231),
    surface: Color.fromARGB(255, 25, 39, 57),
    onSurface: Color.fromARGB(255, 208, 226, 250),
  ),
);

@riverpod
class ThemeProvider extends _$ThemeProvider {
  static const String _themeKey = 'theme_mode';

  @override
  ThemeData build() {
    _loadTheme();
    return darkMode;
  }

  Future<void> _loadTheme() async {
    final isDark = await StorageService.instance.getBool(_themeKey) ?? true;
    state = isDark ? darkMode : lightMode;
  }

  Future<void> toggleTheme() async {
    final isDark = state == darkMode;
    await StorageService.instance.setBool(_themeKey, !isDark);
    state = !isDark ? darkMode : lightMode;
  }
}
