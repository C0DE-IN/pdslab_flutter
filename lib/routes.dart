import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/components/nav_bar.dart';
import 'package:pdslab/pages/contact.dart';
import 'package:pdslab/pages/funds.dart';
import 'package:pdslab/pages/gallery.dart';
import 'package:pdslab/pages/home.dart';
import 'package:pdslab/pages/people.dart';
import 'package:pdslab/pages/publications.dart';
import 'package:pdslab/pages/reource.dart';
import 'package:pdslab/pages/research.dart';

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return SafeArea(
          child: NavBar(title: 'Mitochondrial Biology Lab', child: child),
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
          builder: (context, state) => const Research(
            title: 'Research',
          ),
        ),
        GoRoute(
          path: '/people',
          builder: (context, state) => const People(
            title: 'People',
          ),
        ),
        GoRoute(
          path: '/publications',
          builder: (context, state) => const Publications(
            title: 'Publications',
          ),
        ),
        GoRoute(
          path: '/resource',
          builder: (context, state) => const Resource(
            title: 'Resource',
          ),
        ),
        GoRoute(
          path: '/funds',
          builder: (context, state) => const Funds(
            title: 'Funds',
          ),
        ),
        GoRoute(
          path: '/gallery',
          builder: (context, state) => const Gallery(
            title: 'Gallery',
          ),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const Contact(
            title: 'Contact',
          ),
        ),
      ],
    ),
  ],
);

GoRouter createRouter() {
  return _router;
}
