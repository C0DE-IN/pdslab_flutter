import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pdslab/services/storage_service.dart';

part 'theme_provider.g.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final double glassOpacity;
  final double glassBlur;
  final double glassBorderRadius;

  const CustomTheme({
    required this.glassOpacity,
    required this.glassBlur,
    required this.glassBorderRadius,
  });

  @override
  ThemeExtension<CustomTheme> copyWith({
    double? glassOpacity,
    double? glassBlur,
    double? glassBorderRadius,
  }) {
    return CustomTheme(
      glassOpacity: glassOpacity ?? this.glassOpacity,
      glassBlur: glassBlur ?? this.glassBlur,
      glassBorderRadius: glassBorderRadius ?? this.glassBorderRadius,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      glassOpacity: lerpDouble(glassOpacity, other.glassOpacity, t)!,
      glassBlur: lerpDouble(glassBlur, other.glassBlur, t)!,
      glassBorderRadius:
          lerpDouble(glassBorderRadius, other.glassBorderRadius, t)!,
    );
  }
}

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    // Main colors with sophisticated pastels
    primary: Color(0xFFB7E4F9), // Soft sky blue
    onPrimary: Color(0xFF1B365D), // Deep navy for text
    secondary: Color(0xFFF0E6FF), // Soft lavender
    onSecondary: Color(0xFF4A1B7F), // Deep purple for text
    tertiary: Color(0xFFFFE4E4), // Soft pink
    onTertiary: Color(0xFF8B1E3F), // Deep rose for text

    // Supporting colors
    // background: Color(0xFFFAFAFC), // Light gray background
    // onBackground: Color(0xFF1A1F36), // Deep blue-gray for text
    surface: Color(0xFFF7FBFE), // Ice blue surface
    onSurface: Color(0xFF2D3B55), // Steel blue for text
    // surfaceVariant: Color(0xFFEDF4FF), // Light blue variant
    onSurfaceVariant: Color(0xFF1B365D), // Navy for variant text

    error: Color(0xFFFF6B6B), // Soft red
    onError: Color(0xFF931111), // Deep red for text
  ),
  // Enhanced card theme
  cardTheme: const CardThemeData(
    color: Color(0xFFFDFDFD),
    elevation: 2,
    surfaceTintColor: Color(0xFFFFFFFF),
  ),
  // Custom properties for glassmorphism
  extensions: const <ThemeExtension<dynamic>>[
    CustomTheme(
      glassOpacity: 0.7,
      glassBlur: 10.0,
      glassBorderRadius: 12.0,
    ),
  ],
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    // Main colors
    primary: Color(0xFF1E2C3D), // Deep blue-gray
    onPrimary: Color(0xFFE2F1FF), // Ice blue for text
    secondary: Color(0xFF2A1B3D), // Deep purple
    onSecondary: Color(0xFFF0E6FF), // Soft lavender for text
    tertiary: Color(0xFF2D1F31), // Deep plum
    onTertiary: Color(0xFFFFE4E4), // Soft pink for text

    // Supporting colors
    // background: Color(0xFF0A1221), // Very dark blue background
    // onBackground: Color(0xFFE6EBF5), // Light gray-blue for text
    surface: Color(0xFF162032), // Dark blue surface
    onSurface: Color(0xFFF7FBFE), // Ice blue for text
    // surfaceVariant: Color(0xFF1E2C3D), // Deep blue-gray variant
    onSurfaceVariant: Color(0xFFE2F1FF), // Ice blue for variant text

    error: Color(0xFFFF6B6B), // Soft red
    onError: Color(0xFFFFE4E4), // Soft pink for error text
  ),
  // Enhanced card theme
  cardTheme: const CardThemeData(
    color: Color(0xFF1E2C3D),
    elevation: 4,
    surfaceTintColor: Color(0xFF253447),
  ),
  // Custom properties for glassmorphism
  extensions: const <ThemeExtension<dynamic>>[
    CustomTheme(
      glassOpacity: 0.15,
      glassBlur: 15.0,
      glassBorderRadius: 12.0,
    ),
  ],
);

@riverpod
class ThemeProvider extends _$ThemeProvider {
  static const String _themeKey = 'theme_mode';

  @override
  ThemeData build() {
    _initTheme();
    return darkMode;
  }

  Future<void> _initTheme() async {
    try {
      final isDark = await StorageService.instance.getBool(_themeKey) ?? true;
      state = isDark ? darkMode : lightMode;
    } catch (e) {
      state = darkMode;
    }
  }

  Future<void> toggleTheme() async {
    final isDark = state.brightness == Brightness.dark;
    try {
      await StorageService.instance.setBool(_themeKey, !isDark);
      state = !isDark ? darkMode : lightMode;
    } catch (e) {
      state = !isDark ? darkMode : lightMode;
    }
  }
}
