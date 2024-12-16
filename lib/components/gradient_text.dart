import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Color startColor;
  final Color endColor;

  const GradientText(
      {super.key,
      required this.text,
      required this.startColor,
      required this.endColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Text(text.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.philosopher(
              //bodoniModa , gruppo, philosopher, audiowide, monoton
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w300,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                letterSpacing: 2,
              ),
            )),
      ),
    );
  }
}
