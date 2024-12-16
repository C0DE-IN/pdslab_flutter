import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 213, 185, 144),
      onPrimary: Color.fromARGB(255, 41, 31, 15),
      secondary: Color.fromARGB(255, 217, 203, 176),
      onSecondary: Color.fromARGB(255, 92, 69, 35),
      tertiary: Color.fromARGB(255, 216, 159, 75),
      onTertiary: Color.fromARGB(255, 75, 50, 12),
      error: Color.fromARGB(255, 174, 15, 15),
      onError: Color.fromARGB(255, 250, 250, 250),
      surface: Color.fromRGBO(255, 236, 227, 212),
      onSurface: Color.fromARGB(0, 55, 42, 21)),
);
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(127, 0, 95, 143),
      onPrimary: Color.fromARGB(255, 204, 255, 255),
      secondary: Color.fromARGB(127, 59, 81, 94),
      onSecondary: Color.fromARGB(255, 204, 255, 255),
      tertiary: Color.fromARGB(127, 38, 163, 217),
      onTertiary: Color.fromARGB(255, 30, 36, 36),
      error: Color.fromARGB(255, 222, 2, 2),
      onError: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromRGBO(0, 0, 15, 31),
      onSurface: Color.fromARGB(255, 204, 255, 255)),
);

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ThemeData get themeData {
    return _themeMode == ThemeMode.dark ? darkMode : lightMode;
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }
}


// @layer base {
//   :root {
//     --background: 36 39% 88%;
//     --foreground: 36 45% 15%;
//     --primary: 36 45% 70%;
//     --primary-foreground: 36 45% 11%;
//     --secondary: 40 35% 77%;
//     --secondary-foreground: 36 45% 25%;
//     --accent: 36 64% 57%;
//     --accent-foreground: 36 72% 17%;
//     --destructive: 0 84% 37%;
//     --destructive-foreground: 0 0% 98%;
//     --muted: 36 33% 75%;
//     --muted-foreground: 36 45% 25%;
//     --card: 36 46% 82%;
//     --card-foreground: 36 45% 20%;
//     --popover: 0 0% 100%;
//     --popover-foreground: 240 10% 3.9%;
//     --border: 36 45% 60%;
//     --input: 36 45% 60%;
//     --ring: 36 45% 30%;
//     --chart-1: 25 34% 28%;
//     --chart-2: 26 36% 34%;
//     --chart-3: 28 40% 40%;
//     --chart-4: 31 41% 48%;
//     --chart-5: 35 43% 53%;
//     --radius: 0rem;
//   }
// }
//  --background: 210 100% 6%;
//     --foreground: 180 100% 90%;
//     --primary: 200 100% 28%;
//     --primary-foreground: 180 100% 90%;
//     --secondary: 203 23% 30%;
//     --secondary-foreground: 180 100% 90%;
//     --accent: 198 70% 50%;
//     --accent-foreground: 185 10% 13%;
//     --destructive: 0 98% 44%;
//     --destructive-foreground: 0 0% 100%;
//     --muted: 200 50% 30%;
//     --muted-foreground: 180 100% 90%;
//     --card: 210 100% 12%;
//     --card-foreground: 180 100% 90%;
//     --popover: 210 100% 15%;
//     --popover-foreground: 180 100% 90%;
//     --border: 210 50% 40%;
//     --input: 210 50% 40%;
//     --ring: 180 100% 90%;
