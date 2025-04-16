import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/components/nav_bar.dart';
import 'package:pdslab/pages/pages.dart';

class AppRoutes {
  static const String people = '/people/:name';
}

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              // Background layer with gradient overlay
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
              // Content layer with proper padding
              SafeArea(
                child: NavBar(
                  title: 'Mitochondrial Biology Lab',
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
          path: '/',
          builder: (context, state) => const Home(
            title: 'Home',
          ),
        ),
        GoRoute(
          path: '/research',
          builder: (context, state) => const ResearchPage(),
        ),
        GoRoute(
          path: '/people',
          builder: (context, state) => const PeoplePage(),
        ),
        GoRoute(
          path: AppRoutes.people,
          builder: (context, state) {
            final name = state.pathParameters['name'];
            if (name == null) {
              throw Exception('Name parameter is required');
            }
            return Individual(name: name);
          },
        ),
        GoRoute(
          path: '/publications',
          builder: (context, state) => const PublicationsPage(),
        ),
        GoRoute(
          path: '/resource',
          builder: (context, state) => const Resource(
            title: 'Resource',
          ),
        ),
        GoRoute(
          path: '/funds',
          builder: (context, state) => const FundsPage(),
        ),
        GoRoute(
          path: '/gallery',
          builder: (context, state) => const GalleryPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);

GoRouter createRouter() {
  return _router;
}
