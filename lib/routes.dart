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
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child:
                      NavBar(title: 'Mitochondrial Biology Lab', child: child),
                ),
              ],
            ),
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
