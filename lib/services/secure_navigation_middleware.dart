import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'security_service.dart';

class SecureNavigationMiddleware extends NavigatorObserver {
  final SecurityService _securityService = SecurityService();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _validateNavigation(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _validateNavigation(newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _validateNavigation(Route<dynamic> route) {
    if (route.settings.name != null) {
      final cleanPath = _securityService.sanitizeUrlParam(route.settings.name!);

      // Validate path for potential security issues
      if (cleanPath != route.settings.name) {
        // Log potential security incident
        debugPrint(
            'WARNING: Potentially malicious navigation attempt detected');
      }
    }

    // Validate any query parameters
    if (route.settings.arguments != null) {
      // Handle query parameters validation
      if (route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        args.forEach((key, value) {
          if (value is String) {
            final cleanValue = _securityService.sanitizeUrlParam(value);
            if (cleanValue != value) {
              debugPrint(
                  'WARNING: Potentially malicious query parameter detected');
            }
          }
        });
      }
    }
  }
}
