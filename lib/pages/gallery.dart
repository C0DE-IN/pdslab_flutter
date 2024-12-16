import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Gallery Page',
        ),
      ],
    );
  }
}
