import 'package:flutter/foundation.dart';
import 'dart:html' if (dart.library.html) 'dart:html' as html;
import 'package:sanitize_html/sanitize_html.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class SecurityService {
  static final SecurityService _instance = SecurityService._internal();
  factory SecurityService() => _instance;
  SecurityService._internal();

  String sanitizeHtml(String content) {
    if (!kIsWeb) return content;
    try {
      return sanitizeHtml(content);
    } catch (e) {
      debugPrint('HTML sanitization failed: $e');
      return content;
    }
  }

  // Hash sensitive data
  String hashData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Prevent XSS in URL parameters
  String sanitizeUrlParam(String param) {
    return Uri.encodeComponent(param);
  }

  // Security headers check
  void enforceSecurityHeaders() {
    if (!kIsWeb) return;

    final headers = {
      'X-Frame-Options': 'SAMEORIGIN',
      'X-Content-Type-Options': 'nosniff',
      'Referrer-Policy': 'strict-origin-when-cross-origin',
    };

    headers.forEach((key, value) {
      final meta = html.MetaElement()
        ..httpEquiv = key
        ..content = value;
      html.document.head?.children.add(meta);
    });
  }

  // Prevent data leakage
  void clearSensitiveData() {
    if (!kIsWeb) return;

    final sensitiveKeys = ['auth_token', 'user_data', 'session_data'];
    for (var key in sensitiveKeys) {
      html.window.localStorage.remove(key);
      html.window.sessionStorage.remove(key);
    }
  }

  // Validate external URLs
  bool isValidExternalUrl(String url) {
    try {
      final uri = Uri.parse(url);
      // Allow only specific domains
      final allowedDomains = [
        'iisc.ac.in',
        'google.com',
        'github.com',
        // Add other trusted domains
      ];
      return allowedDomains.any((domain) => uri.host.endsWith(domain));
    } catch (e) {
      return false;
    }
  }

  // Prevent common web attacks
  void applySecurityMeasures(html.Window window) {
    if (!kIsWeb) return;

    // Set security attributes safely
    window.document.documentElement
        ?.setAttribute('style', 'pointer-events: auto');

    // Prevent right-click on sensitive content
    window.document.documentElement?.addEventListener('contextmenu', (event) {
      event.preventDefault();
    });

    // Prevent drag and drop of sensitive content
    window.document.documentElement?.addEventListener('dragstart', (event) {
      event.preventDefault();
    });

    // Add noopener to external links
    window.document.querySelectorAll('a[target="_blank"]').forEach((element) {
      element.setAttribute('rel', 'noopener noreferrer');
    });
  }
}
