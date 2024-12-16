import 'package:flutter/material.dart';

class ElevBtn extends StatelessWidget {
  final String btnTxt;
  final Function()? onPressed;
  const ElevBtn({super.key, required this.btnTxt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onTertiary,
        padding: const EdgeInsets.all(24.0),
        minimumSize: const Size(200.0, 50.0));

    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(btnTxt),
    );
  }
}
