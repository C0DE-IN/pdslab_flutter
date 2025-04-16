import 'package:flutter/foundation.dart';
import 'dart:html' if (dart.library.html) 'dart:html' as html;

class WebConfig {
  static void initializeWeb() {
    if (kIsWeb) {
      // Cache canvaskit to improve subsequent loads
      const String canvaskitVersion =
          '0.38.14'; // Update this version as needed
      final List<String> skiaWasmFileNames = <String>[
        'canvaskit.wasm',
        'canvaskit.js',
      ];

      for (final String fileName in skiaWasmFileNames) {
        // Prefetch CanvasKit files
        final link = html.LinkElement()
          ..rel = 'prefetch'
          ..href =
              'https://www.gstatic.com/flutter-canvaskit/$canvaskitVersion/$fileName';
        html.document.head?.append(link);
      }
    }
  }
}
