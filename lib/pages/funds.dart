import 'package:flutter/material.dart';

class Funds extends StatelessWidget {
  const Funds({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Funds Page',
        ),
      ],
    );
  }
}
