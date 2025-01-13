import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final String? backgroundImage; // Add this line

  const BackgroundContainer({
    super.key,
    required this.child,
    this.backgroundImage, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                opacity:
                    0.15, // Adjust this value to make the background more or less visible
              )
            : null,
      ),
      child: child,
    );
  }
}
