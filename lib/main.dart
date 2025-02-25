import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pdslab/components/background_container.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'package:pdslab/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _router = createRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
    await SharedPreferences.getInstance();
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProviderProvider);

    return MaterialApp.router(
      title: 'Mitochondrial Biology Lab',
      theme: theme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BackgroundContainer(
          backgroundImage: 'lib/assets/images/bg/bg.webp',
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
