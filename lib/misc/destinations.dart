import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label, this.path);
  final IconData icon;
  final String label;
  final String path;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.home, 'Home', '/'),
  Destination(Icons.biotech, 'Research', '/research'),
  Destination(Icons.groups, 'People', '/people'),
  Destination(Icons.article, 'Publications', '/publications'),
  Destination(Icons.travel_explore, 'Resource', '/resource'),
  Destination(Icons.currency_rupee, 'Funds', '/funds'),
  Destination(Icons.photo_library, 'Gallery', '/gallery'),
  Destination(Icons.contact_page, 'Contact', '/contact'),
];
