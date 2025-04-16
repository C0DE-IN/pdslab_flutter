import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pdslab/pages/home.dart';
import 'package:pdslab/pages/research.dart';
import 'package:pdslab/pages/people.dart';
import 'package:pdslab/pages/publications.dart';
import 'package:pdslab/pages/funds.dart';
import 'package:pdslab/pages/gallery.dart';
import 'package:pdslab/pages/contact.dart';
import 'package:pdslab/pages/individual.dart';
import 'package:pdslab/components/nav_bar.dart';
import 'package:pdslab/services/secure_navigation_middleware.dart';
import 'dart:html' as html;
import 'services/security_service.dart';

class AppRoutes {
  static const String home = '/';
  static const String research = '/research';
  static const String people = '/people';
  static const String person = '/people/:name';
  static const String publications = '/publications';
  static const String funds = '/funds';
  static const String gallery = '/gallery';
  static const String contact = '/contact';
}

// Page metadata for SEO
class PageMetadata {
  final String title;
  final String description;
  final String canonicalUrl;

  const PageMetadata({
    required this.title,
    required this.description,
    required this.canonicalUrl,
  });
}

final Map<String, PageMetadata> pageMetadata = {
  AppRoutes.home: const PageMetadata(
    title: 'Mitochondrial Biology Lab',
    description:
        'Welcome to Mitochondrial Biology Lab at IISc, focusing on cutting-edge research in biochemistry and cell biology.',
    canonicalUrl: '/',
  ),
  AppRoutes.research: const PageMetadata(
    title: 'Research Areas - Mitochondrial Biology Lab',
    description:
        'Explore our research areas and ongoing projects in mitochondrial biology and biochemistry at IISc.',
    canonicalUrl: '/research',
  ),
  AppRoutes.people: const PageMetadata(
    title: 'Our Team - Mitochondrial Biology Lab',
    description:
        'Meet our team of researchers, faculty, and students at Mitochondrial Biology Lab, Indian Institute of Science.',
    canonicalUrl: '/people',
  ),
  AppRoutes.publications: const PageMetadata(
    title: 'Publications - Mitochondrial Biology Lab',
    description:
        'View our research publications, papers, and academic contributions from Mitochondrial Biology Lab, IISc.',
    canonicalUrl: '/publications',
  ),
  AppRoutes.funds: const PageMetadata(
    title: 'Research Funding - Mitochondrial Biology Lab',
    description:
        'Information about research funding and grants at Mitochondrial Biology Lab, Indian Institute of Science.',
    canonicalUrl: '/funds',
  ),
  AppRoutes.gallery: const PageMetadata(
    title: 'Photo Gallery - Mitochondrial Biology Lab',
    description:
        'Browse photos and media from events and activities at Mitochondrial Biology Lab, IISc.',
    canonicalUrl: '/gallery',
  ),
  AppRoutes.contact: const PageMetadata(
    title: 'Contact Us - Mitochondrial Biology Lab',
    description:
        'Get in touch with Mitochondrial Biology Lab at Indian Institute of Science. Find our location and contact information.',
    canonicalUrl: '/contact',
  ),
};

class SecurityMiddleware extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _applySecurity();
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _applySecurity();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _applySecurity() {
    if (kIsWeb) {
      // Prevent clickjacking
      html.window.document.documentElement?.style
          .setProperty('pointer-events', 'auto');

      // Clear sensitive data from localStorage on navigation
      const sensitiveKeys = ['auth_token', 'user_data'];
      for (var key in sensitiveKeys) {
        if (!html.window.localStorage.containsKey(key)) continue;
        if (_isSessionExpired()) {
          html.window.localStorage.remove(key);
        }
      }
    }
  }

  bool _isSessionExpired() {
    final lastActivity = html.window.localStorage['last_activity'];
    if (lastActivity == null) return true;

    final lastActivityTime = DateTime.tryParse(lastActivity);
    if (lastActivityTime == null) return true;

    // Session timeout after 24 hours of inactivity
    return DateTime.now().difference(lastActivityTime).inHours >= 24;
  }
}

final GoRouter _router = GoRouter(
  observers: [SecurityMiddleware(), SecureNavigationMiddleware()],
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final metadata =
            pageMetadata[state.path] ?? pageMetadata[AppRoutes.home]!;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              if (kIsWeb)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('lib/assets/images/bg/bg.webp'),
                        fit: BoxFit.cover,
                        opacity: isDarkMode ? 0.12 : 0.2,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.85),
                          BlendMode.overlay,
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                child: NavBar(
                  title: metadata.title,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const Home(title: 'Home'),
        ),
        GoRoute(
          path: AppRoutes.research,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const ResearchPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.people,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PeoplePage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.person,
          pageBuilder: (context, state) {
            final name = state.pathParameters['name'];
            if (name == null) {
              throw Exception('Name parameter is required');
            }
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: Individual(name: name),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.publications,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PublicationsPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.funds,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const FundsPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.gallery,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const GalleryPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.contact,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const ContactPage(),
          ),
        ),
      ],
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    // Add security validation for all routes
    if (kIsWeb) {
      final path = state.uri.path;
      if (path.contains('..') || path.contains('//')) {
        return '/'; // Redirect to home on suspicious paths
      }

      // Validate query parameters
      final securityService = SecurityService();
      final params = state.uri.queryParameters;
      if (params.isNotEmpty) {
        for (final param in params.values) {
          if (!securityService.sanitizeUrlParam(param).contains(param)) {
            return '/'; // Redirect to home on suspicious query parameters
          }
        }
      }
    }
    return null; // No redirect needed
  },
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page not found',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  },
);

GoRouter createRouter() {
  return _router;
}
