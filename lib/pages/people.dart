import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'People Page',
        ),
      ],
    );
  }
}
