import 'dart:html' if (dart.library.html) 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'security_service.dart';

class SecureNetworkInterceptor {
  final SecurityService _securityService = SecurityService();

  void configureSecurityHeaders() {
    if (!kIsWeb) return;

    final head = html.document.head;
    if (head == null) return;

    final securityHeaders = {
      'Content-Security-Policy': "default-src 'self'; "
          "script-src 'self' 'unsafe-inline' 'unsafe-eval'; "
          "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
          "font-src 'self' https://fonts.gstatic.com; "
          "img-src 'self' data: https:; "
          "connect-src 'self' https:;",
      'X-Content-Type-Options': 'nosniff',
      'X-Frame-Options': 'SAMEORIGIN',
      'Referrer-Policy': 'strict-origin-when-cross-origin',
    };

    securityHeaders.forEach((key, value) {
      final meta = html.MetaElement()
        ..httpEquiv = key
        ..content = value;
      head.children.add(meta);
    });
  }

  bool validateUrl(String url) {
    if (!kIsWeb) return true;
    return _securityService.isValidExternalUrl(url);
  }

  String sanitizeResponse(String response) {
    if (!kIsWeb) return response;
    return _securityService.sanitizeHtml(response);
  }

  void preventXSS() {
    if (!kIsWeb) return;

    final body = html.document.documentElement;
    if (body != null) {
      final htmlContent = body.innerHtml ?? '';
      if (htmlContent.isNotEmpty) {
        final sanitizedHtml = _securityService.sanitizeHtml(htmlContent);
        body.setInnerHtml(sanitizedHtml,
            validator: html.NodeValidatorBuilder()
              ..allowHtml5()
              ..allowNavigation()
              ..allowImages());
      }
    }
  }
}
