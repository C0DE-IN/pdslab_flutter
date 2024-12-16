import 'package:flutter/material.dart';

class Resource extends StatelessWidget {
  const Resource({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Resource Page',
        ),
      ],
    );
  }
}
