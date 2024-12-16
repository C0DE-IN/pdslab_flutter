import 'package:flutter/material.dart';

class Publications extends StatelessWidget {
  const Publications({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Publications Page',
        ),
      ],
    );
  }
}
