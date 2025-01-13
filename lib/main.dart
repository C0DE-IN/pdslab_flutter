import 'package:flutter/material.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'package:pdslab/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:pdslab/components/background_container.dart';

final _router = createRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'FINACE',
          themeMode: themeProvider.themeMode,
          theme: lightMode,
          darkTheme: darkMode,
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return BackgroundContainer(
              backgroundImage: 'lib/assets/images/bg/bg.jpg',
              child: child ?? const SizedBox(), // Add this line
            );
          },
        );
      },
    );
  }
}
