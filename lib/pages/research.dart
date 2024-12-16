import 'package:flutter/material.dart';

class Research extends StatelessWidget {
  const Research({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Research Page',
        ),
      ],
    );
  }
}
