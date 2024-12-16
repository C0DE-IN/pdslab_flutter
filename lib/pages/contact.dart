import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Contact Page',
        ),
      ],
    );
  }
}
